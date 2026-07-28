import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/home/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Features/live_tracking/Presentation/View/NurseTracking.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';
import 'package:nabdh/Core/helper/show_snack_bar.dart';

class ConfirmedBookingPage extends StatefulWidget {
  final String nurseName;
  final String nurseRole;
  final double rating;
  final String experience;
  final String imageUrl;
  final String serviceTitle;
  final String location;
  final String expectedTime;

  const ConfirmedBookingPage({
    super.key,
    this.nurseName = 'أحمد العتيبي',
    this.nurseRole = 'أخصائي تمريض',
    this.rating = 4.9,
    this.experience = '10 سنوات خبرة',
    this.imageUrl =
        'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&auto=format&fit=crop',
    this.serviceTitle = 'تمريض منزلي',
    this.location = 'مدينة نصر، القاهرة',
    this.expectedTime = 'خلال 20 دقيقة',
  });

  @override
  State<ConfirmedBookingPage> createState() => _ConfirmedBookingPageState();
}

class _ConfirmedBookingPageState extends State<ConfirmedBookingPage> {
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
          title: Text(
            'NABDH',
            style: TextStyle(
              letterSpacing: -0.8,
              color: AppColors.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: [
                      // ---------- Success Hero Badge ----------
                      Center(
                        child: Container(
                          width: 76.w,
                          height: 76.w,
                          decoration: const BoxDecoration(
                            color: Color(0xffEAF4F2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ---------- Title & Subtitle ----------
                      Text(
                        'تم تأكيد الحجز بنجاح',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'تم تأكيد طلبك بنجاح، وتم تعيين الممرض لخدمتك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // ---------- Assigned Nurse Card ----------
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.borderGrey.withOpacity(0.6),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.r),
                                  child: Image.network(
                                    widget.imageUrl,
                                    width: 56.w,
                                    height: 56.w,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              width: 56.w,
                                              height: 56.w,
                                              color: AppColors.primary
                                                  .withOpacity(0.1),
                                              child: Icon(
                                                Icons.person,
                                                color: AppColors.primary,
                                                size: 30.sp,
                                              ),
                                            ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      width: 16.w,
                                      height: 16.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 11.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.nurseRole,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 3.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffEAF4F2),
                                          borderRadius: BorderRadius.circular(
                                            14.r,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color: AppColors.primary,
                                              size: 14.sp,
                                            ),
                                            SizedBox(width: 2.w),
                                            Text(
                                              '${widget.rating}',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: AppColors.hintGrey,
                                        size: 14.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        widget.experience,
                                        style: TextStyle(
                                          color: AppColors.hintGrey,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ---------- Service Details Card (3 items) ----------
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.borderGrey.withOpacity(0.6),
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
                          children: [
                            _buildDetailRow(
                              icon: Icons.medical_services_outlined,
                              label: 'الخدمة',
                              value: widget.serviceTitle,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Divider(
                                color: AppColors.borderGrey.withOpacity(0.6),
                                height: 1,
                              ),
                            ),
                            _buildDetailRow(
                              icon: Icons.location_on_outlined,
                              label: 'الموقع',
                              value: widget.location,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Divider(
                                color: AppColors.borderGrey.withOpacity(0.6),
                                height: 1,
                              ),
                            ),
                            _buildDetailRow(
                              icon: Icons.access_time_outlined,
                              label: 'الوقت المتوقع',
                              value: widget.expectedTime,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ---------- Booking Status Card ----------
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xffF6F8F8),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.borderGrey.withOpacity(0.5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'تم تأكيد الحجز',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'سيبدأ الممرض التوجه إلى موقعك قريباً، ويمكنك متابعة حالته لحظة بلحظة',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),

              // ---------- Action Buttons ----------
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                child: Column(
                  children: [
                    // Track Nurse Button
                    SizedBox(
                      width: double.infinity,
                      height: 54.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        onPressed: () {
                          showCustomSnackBar(
                            context,
                            text: 'جاري فتح خريطة تتبع الممرض...',
                            status: SnackBarStatus.info,
                          );
                          goTo(context, page: NurseTrackingPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.rotate(
                              angle: -0.6,
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'تتبع الممرض',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Return to Home Button
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.borderGrey,
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        onPressed: () {
                          goTo(
                            context,
                            page: const HomePage(),
                            state: NavAction.pushRemove,
                          );
                        },
                        child: Text(
                          'العودة للرئيسية',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.hintGrey,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: const Color(0xffF4F7F7),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: AppColors.primary, size: 22.sp),
        ),
      ],
    );
  }
}
