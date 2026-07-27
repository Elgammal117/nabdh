import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/ClientHome/Presentation/View/Offers.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class FindingNursePage extends StatefulWidget {
  const FindingNursePage({super.key});

  @override
  State<FindingNursePage> createState() => _FindingNursePageState();
}

class _FindingNursePageState extends State<FindingNursePage> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        goTo(context, page: const OffersPage(), state: NavAction.pushReplace);
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'NABDH',
            style: TextStyle(
              letterSpacing: -0.8,
              color: AppColors.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          automaticallyImplyLeading: false,

          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.primary,
                size: 28.sp,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 4.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header Title & Subtitle
                      Text(
                        'جاري البحث عن ممرض',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'تم إرسال طلبك بنجاح، ويتم الآن البحث عن أفضل الممرضين المتاحين بالقرب منك.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 28.h),

                      // Location Pin with soft glowing circular background
                      Center(
                        child: Container(
                          width: 140.w,
                          height: 140.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                AppColors.primary.withOpacity(0.12),
                                AppColors.primary.withOpacity(0.04),
                                Colors.transparent,
                              ],
                              stops: const [0.3, 0.65, 1.0],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.location_on,
                              color: AppColors.primary,
                              size: 38.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Animated Loading Indicator & Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 18.w,
                            height: 18.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'جاري البحث عن الممرضين...',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),

                      // Order Summary Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.borderGrey.withOpacity(0.7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.assignment_outlined,
                                  color: AppColors.primary,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  'ملخص الطلب',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.medical_services_outlined,
                                  color: AppColors.primary,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'تمريض منزلي',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primary,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'مدينة نصر، القاهرة 📍',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Status Notification Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.borderGrey.withOpacity(0.7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'يتم الآن إشعار الممرضين القريبين',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        'يتم إرسال طلبك إلى الممرضين المؤهلين والمتاحين، وستظهر العروض فور وصولها.',
                                        style: TextStyle(
                                          color: AppColors.hintGrey,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            // Progress bar
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: LinearProgressIndicator(
                                minHeight: 4.h,
                                backgroundColor: AppColors.borderGrey
                                    .withOpacity(0.5),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Info Hint Box
                      Container(
                        height: 122,
                        width: double.infinity,
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F7F7),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppColors.primary,
                              size: 20.sp,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                'قد يستغرق البحث بضع ثوان حسب عدد الممرضين المتاحين في منطقتك.',
                                style: TextStyle(
                                  color: AppColors.hintGrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 80.h,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'إلغاء الطلب',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.close,
                                color: AppColors.primary,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () {
                          _navigationTimer?.cancel();
                          goTo(
                            context,
                            page: const OffersPage(),
                            state: NavAction.pushReplace,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.hintGrey,
                              size: 14.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'سيتم نقل تلقائياً إلى صفحة العروض عند وصول أول عرض.',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Cancel Button & Footer note
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                child: Column(children: [SizedBox(height: 12.h)]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
