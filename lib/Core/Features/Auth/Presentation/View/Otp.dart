import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginCubit.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/NumVerifyCubit.dart/NumVerifyCubit.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/NumVerifyCubit.dart/NumVerifyState.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/View/Sign_up.dart';
import 'package:nabdh/Core/Features/home/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart' as my_nav;
import 'package:nabdh/Core/helper/my_navigator.dart';
import 'package:nabdh/Core/helper/show_snack_bar.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({
    super.key,
    required this.email,
    required this.type,
    this.deviceinfo,
  });

  final String email;
  final String type;
  final Map<String, dynamic>? deviceinfo;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  static const int _otpLength = 6;
  static const int _resendSeconds = 60;
  String code = '';

  final SigninCubit _signinCubit = SigninCubit();
  final NumVerifyCubit _numVerifyCubit = NumVerifyCubit();

  final List<TextEditingController> _controllers = List.generate(
    _otpLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    _otpLength,
    (_) => FocusNode(),
  );

  late int _secondsLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsLeft = _resendSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  String get _formattedTime {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    _signinCubit.close();
    _numVerifyCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _signinCubit),
        BlocProvider.value(value: _numVerifyCubit),
      ],
      child: BlocConsumer<NumVerifyCubit, NumVerifyCubitState>(
        listener: (context, state) {
          if (state is NumVerifyCubitLoading) {
            showCustomSnackBar(
              context,
              text: 'جاري التحقق من الرمز',
              status: SnackBarStatus.info,
            );
          } else if (state is NumVerifyCubitSuccess) {
            showCustomSnackBar(
              context,
              text: state.message,
              status: SnackBarStatus.success,
            );
            if (state.isNewUser) {
              print(state.accessToken);
              goTo(
                context,
                page: Signup(accessToken: state.accessToken),
                state: NavAction.pushRemove,
              );
            } else {
              print(state.accessToken);

              goTo(context, page: HomePage(), state: NavAction.pushRemove);
            }
          } else if (state is NumVerifyCubitError) {
            showCustomSnackBar(
              context,
              text: state.message,
              status: SnackBarStatus.fail,
            );
          }
        },
        builder: (context, state) => Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 24.sp,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'NABDH',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 46.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/NABDH Premium Logo.png',
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 28.h),

                    // ---------- Title ----------
                    Text(
                      'تأكيد رقم الهاتف',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // ---------- Subtitle ----------
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 15.sp,
                          height: 1.7,
                        ),
                        children: [
                          const TextSpan(
                            text: 'تم إرسال رمز التحقق إلى رقم الهاتف: ',
                          ),
                          TextSpan(
                            text: widget.email,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(
                            text: '. يرجى إدخال رمز التحقق المكون من 6 أرقام.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),

                    // ---------- OTP boxes ----------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_otpLength, (index) {
                        return SizedBox(
                          width: 50.w,
                          height: 58.h,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.r),
                                borderSide: BorderSide(
                                  color: AppColors.borderGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.r),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            onChanged: (value) => _onChanged(value, index),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 32.h),

                    // ---------- Resend timer ----------
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (_secondsLeft > 0) {
                            return;
                          }

                          final sent = await SigninCubit.get(
                            context,
                          ).resendOtp(email: widget.email, type: widget.type);

                          if (!context.mounted) return;

                          if (sent) {
                            _startTimer();
                          }

                          showCustomSnackBar(
                            context,
                            text: sent
                                ? 'تم إعادة إرسال الرمز بنجاح'
                                : 'فشل إعادة إرسال الرمز',
                            status: sent
                                ? SnackBarStatus.success
                                : SnackBarStatus.fail,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _formattedTime,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'إعادة إرسال الرمز خلال ',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 14.sp,
                              ),
                            ),

                            Icon(
                              Icons.access_time,
                              color: AppColors.hintGrey,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // ---------- Confirm button ----------
                    SizedBox(
                      width: double.infinity,
                      height: 58.h,
                      child: ElevatedButton(
                        onPressed: () {
                          code = _controllers.map((c) => c.text).join();
                          print('this is code : $code');
                          if (code.length < _otpLength) return;
                          NumVerifyCubit.get(context).otpverifylogic(
                            email: widget.email,
                            otp: code,
                            type: widget.type,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          elevation: 0,
                        ),
                        child: state is NumVerifyCubitLoading
                            ? SizedBox(
                                width: 22.w,
                                height: 22.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                'تأكيد',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // ---------- Security info box ----------
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 18.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.borderGrey,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'لأمان حسابك، لا تشارك رمز التحقق مع أي شخص. سيقوم فريق NABDH بالتواصل معك فقط عبر القنوات الرسمية.',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 13.sp,
                                height: 1.7,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 28.w,
                            height: 28.w,
                            child: SvgPicture.asset(
                              'assets/Icon.svg',
                              color: AppColors.primary,
                              width: 16.w,
                              height: 16.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),

              // ---------- Top bar ----------

              // ---------- Logo ----------
            ],
          ),
        ),
      ),
    );
  }
}
