import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabdh/Auth/Sign_in.dart';
import 'package:nabdh/Auth/Sign_up.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  static const Color primaryTeal = Color(0xFF00685F);
  static const Color borderGrey = Color(0xFFE3E6EA);
  static const Color hintGrey = Color(0xFF3E4947);
  static const Color infoBoxGrey = Color(0xFFF2F4F3);

  static const int _otpLength = 6;
  static const int _resendSeconds = 60;

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

  void _onResend() {
    if (_secondsLeft > 0) return;
    // TODO: trigger resend OTP API call
    _startTimer();
  }

  void _onConfirm() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length < _otpLength) return;
    // TODO: handle OTP confirmation
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: primaryTeal,
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
                      color: hintGrey,
                      fontSize: 15.sp,
                      height: 1.7,
                    ),
                    children: [
                      const TextSpan(
                        text: 'تم إرسال رمز التحقق إلى رقم الهاتف: ',
                      ),
                      TextSpan(
                        text: widget.phoneNumber,
                        style: const TextStyle(
                          color: primaryTeal,
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
                            borderSide: BorderSide(color: borderGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(
                              color: primaryTeal,
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
                    onTap: _onResend,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'إعادة إرسال الرمز خلال ',
                          style: TextStyle(color: hintGrey, fontSize: 14.sp),
                        ),
                        Text(
                          _formattedTime,
                          style: TextStyle(
                            color: primaryTeal,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),

                        Icon(Icons.access_time, color: hintGrey, size: 16.sp),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryTeal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
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
                    color: infoBoxGrey,
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
                            color: hintGrey,
                            fontSize: 13.sp,
                            height: 1.7,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        width: 28.w,
                        height: 28.w,
                        child: SvgPicture.asset(
                          'assets/Icon.svg',
                          color: primaryTeal,
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
    );
  }
}
