import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Util/app_colors.dart';

class NurseTrackingPage extends StatefulWidget {
  final String expectedArrival;

  const NurseTrackingPage({super.key, this.expectedArrival = '10 دقائق'});

  @override
  State<NurseTrackingPage> createState() => _NurseTrackingPageState();
}

class _NurseTrackingPageState extends State<NurseTrackingPage> {
  bool _arrived = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,

          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.primary,
                size: 26.sp,
              ),
            ),
          ],

          title: Text(
            'تتبع الممرض',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
              letterSpacing: -0.4.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تتبع الممرض',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'تابع موقع الممرض حتى وصوله إليك.',
                    style: TextStyle(
                      color: AppColors.hintGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // ─────── Title & Subtitle ───────
            SizedBox(height: 20.h),

            // ─────── Map with floating overlays ───────
            Stack(
              children: [
                // Map Image (base layer)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    'assets/Map.png',
                    width: double.infinity,
                    height: 550.h,
                    fit: BoxFit.cover,
                  ),
                ),

                // ─── ETA floating card (top) ───
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  right: 12.w,
                  child: Container(
                    height: 100.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 12.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'وقت الوصول المتوقع',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              widget.expectedArrival,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 44.w,
                          height: 44.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAF4F2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.access_time_rounded,
                            color: AppColors.primary,
                            size: 22.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ─── Status floating card (bottom) ───
                Positioned(
                  bottom: 12.h,
                  left: 12.w,
                  right: 12.w,
                  child: Container(
                    height: 100.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 16.w),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الممرض في الطريق إليك',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'يتم تحديث الموقع الآن مباشرة',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  // Arrived Button
                  SizedBox(
                    width: double.infinity,
                    height: 80.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _arrived
                            ? AppColors.primary
                            : const Color(0xffE0E0E0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onPressed: _arrived ? () {} : null,
                      child: Text(
                        'تم الوصول',
                        style: TextStyle(
                          color: _arrived ? Colors.white : AppColors.hintGrey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Hint text
                  Text(
                    'سيتم تفعيل هذا الزر بمجرد وصول الممرض إلى موقعك.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.hintGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
