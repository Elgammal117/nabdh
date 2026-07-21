import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginCubit.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginState.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/View/Otp.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SigninCubit(),
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 36.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ---------- Logo ----------
                  Center(
                    child: Image.asset(
                      'assets/NABDH Premium Logo.png',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // ---------- Title ----------
                  Text(
                    'مرحباً بعودتك',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // ---------- Subtitle ----------
                  Text(
                    'سجل الدخول للوصول إلى خدمات التمريض\nالمنزلي بسهولة وأمان.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff3E4947), fontSize: 16.sp),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'نوع المستخدم',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff3E4947),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Color(0xffF4F3F3),
                    ),
                    height: 50.h,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                SigninCubit.get(context).setType('PATIENT');
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color:
                                      SigninCubit.get(context).type == 'PATIENT'
                                      ? AppColors.primary
                                      : Color(0xffF4F3F3),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'مريض',
                                    style: TextStyle(
                                      color:
                                          SigninCubit.get(context).type ==
                                              'PATIENT'
                                          ? Colors.white
                                          : AppColors.hintGrey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                SigninCubit.get(context).setType('NURSE');
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color:
                                      SigninCubit.get(context).type == 'NURSE'
                                      ? AppColors.primary
                                      : Color(0xffF4F3F3),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'ممرض',
                                    style: TextStyle(
                                      color:
                                          SigninCubit.get(context).type ==
                                              'NURSE'
                                          ? Colors.white
                                          : AppColors.hintGrey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ---------- Phone label ----------
                  Text(
                    'رقم الهاتف المحمول',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff3E4947),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ---------- Phone input ----------
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 14.w),
                        Container(
                          width: 1.w,
                          height: 26.h,
                          color: AppColors.borderGrey,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: SigninCubit.get(
                              context,
                            ).phoneController,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.sp),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                              ),
                              hintText: 'ادخل رقم الهاتف المحمول',
                              hintStyle: TextStyle(
                                color: AppColors.hintGrey.withOpacity(0.6),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '20+',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 18.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ---------- Continue button ----------
                  SizedBox(
                    height: 58.h,
                    child: ElevatedButton(
                      onPressed: state is Loading
                          ? null
                          : () async {
                              final cubit = SigninCubit.get(context);
                              final sent = await cubit.signinlogic();

                              if (!context.mounted) return;

                              if (sent) {
                                goTo(
                                  context,
                                  page: OtpVerification(
                                    phoneNumber:
                                        '+20${cubit.phoneController.text}',
                                    type: cubit.type,
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 0,
                      ),
                      child: state is Loading
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
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection: TextDirection.ltr,
                              children: [
                                Text(
                                  'متابعة',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // ---------- Feature pills ----------
                  _FeaturePill(
                    label: 'ممرضون معتمدون',
                    icon: Icons.check,
                    primaryTeal: AppColors.primary,
                    borderGrey: AppColors.borderGrey,
                  ),
                  SizedBox(height: 14.h),
                  _FeaturePill(
                    label: 'خدمات آمنة',
                    icon: Icons.verified_user_outlined,
                    primaryTeal: AppColors.primary,
                    borderGrey: AppColors.borderGrey,
                  ),
                  SizedBox(height: 14.h),
                  _FeaturePill(
                    label: 'استجابة سريعة',
                    icon: Icons.bolt,
                    primaryTeal: AppColors.primary,
                    borderGrey: AppColors.borderGrey,
                  ),
                  SizedBox(height: 64.h),

                  // ---------- Footer links ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'الشروط والأحكام',
                        style: TextStyle(
                          color: Color(0xffBEC9C6),
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '•',
                        style: TextStyle(
                          color: Color(0xffBEC9C6),
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'سياسة الخصوصية',
                        style: TextStyle(
                          color: Color(0xffBEC9C6),
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Feature pill row ----------
class _FeaturePill extends StatelessWidget {
  const _FeaturePill({
    required this.label,
    required this.icon,
    required this.primaryTeal,
    required this.borderGrey,
  });

  final String label;
  final IconData icon;
  final Color primaryTeal;
  final Color borderGrey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Color(0xffBEC9C6).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: Color(0xff00685F).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryTeal, size: 16.sp),
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              color: Color(0xff576060),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
