import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabdh/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingFlow()),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250.h),
            Container(
              height: 160.h,
              width: 160.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff00685F).withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/NABDH Premium Logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'نبض',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xff00685F),
              ),
            ),
            SizedBox(height: 12.h),

            Text(
              'رعاية تمريضية منزلية متميزة بين يديك',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18.sp,
                color: const Color(0xff3D4947),
              ),
            ),
            SizedBox(height: 250.h),
            Container(
              height: 5.h,
              width: 140.w,
              decoration: BoxDecoration(
                color: const Color(0xffE5E5E5),
                borderRadius: BorderRadius.circular(2.h),
              ),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  const Color(0xff00685F),
                ),
                backgroundColor: const Color(0xffE5E5E5),
              ),
            ),
            SizedBox(height: 32.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'رعاية صحية مرخصة وموثوقة',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14.sp,
                    color: const Color(0xff3D4947),
                  ),
                ),
                SizedBox(width: 4.w),

                SvgPicture.asset('assets/Icon.svg', height: 20.h, width: 20.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
