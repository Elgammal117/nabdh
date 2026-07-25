import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/ClientHome/Presentation/View/ConfirmedBooking.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';
import 'package:nabdh/Core/helper/show_snack_bar.dart';

class NurseProfilePage extends StatefulWidget {
  final String name;
  final double rating;
  final int reviewsCount;
  final int price;
  final String imageUrl;

  const NurseProfilePage({
    super.key,
    this.name = 'أحمد العتيبي',
    this.rating = 4.9,
    this.reviewsCount = 212,
    this.price = 250,
    this.imageUrl =
        'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&auto=format&fit=crop',
  });

  @override
  State<NurseProfilePage> createState() => _NurseProfilePageState();
}

class _NurseProfilePageState extends State<NurseProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              // ---------- Header ----------
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الملف الشخصي للممرض',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showCustomSnackBar(
                              context,
                              text: 'تم مشاركة ملف الممرض',
                              status: SnackBarStatus.info,
                            );
                          },
                          icon: Icon(
                            Icons.share_outlined,
                            color: AppColors.primary,
                            size: 24.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_forward,
                            color: AppColors.primary,
                            size: 26.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ---------- Main Scrollable Content ----------
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ---------- Nurse Header Card ----------
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.borderGrey.withOpacity(0.6),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(45.r),
                                  child: Image.network(
                                    widget.imageUrl,
                                    width: 90.w,
                                    height: 90.w,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                      width: 90.w,
                                      height: 90.w,
                                      color: AppColors.primary.withOpacity(0.1),
                                      child: Icon(
                                        Icons.person,
                                        color: AppColors.primary,
                                        size: 50.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 2.h,
                                  right: 2.w,
                                  child: Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 13.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffEAF4F2),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'تم التحقق',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'أخصائي تمريض',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: const Color(0xFFFFB800),
                                  size: 20.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '${widget.rating} ',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '(${widget.reviewsCount} تقييم)',
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
                      SizedBox(height: 16.h),

                      // ---------- Stats 2x2 Grid ----------
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              icon: Icons.star_outline_rounded,
                              value: '${widget.rating}',
                              label: 'متوسط التقييم',
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: _buildStatCard(
                              icon: Icons.people_outline_rounded,
                              value: '+500',
                              label: 'مريض',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              icon: Icons.check_circle_outline_rounded,
                              value: '100%',
                              label: 'إتمام الطلبات',
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: _buildStatCard(
                              icon: Icons.workspace_premium_outlined,
                              value: '8',
                              label: 'سنوات خبرة',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // ---------- About Nurse Section ----------
                      Text(
                        'عن الممرض',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'ممرض متخصص في الرعاية المنزلية ومتابعة كبار السن مع خبرة واسعة في تقديم الرعاية الصحية المنزلية. مهارات ممتازة في تركيب المحاليل، متابعة ضغط الدم والسكري، وتقديم الدعم النفسي والجسدي للمرضى.',
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // ---------- Professional Info Section ----------
                      Text(
                        'المعلومات المهنية',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      _buildProfessionalInfoTile(
                        icon: Icons.medical_services_outlined,
                        title: 'التخصص',
                        subtitle: 'تمريض منزلي',
                      ),
                      SizedBox(height: 10.h),
                      _buildProfessionalInfoTile(
                        icon: Icons.school_outlined,
                        title: 'المؤهل',
                        subtitle: 'بكالوريوس تمريض',
                      ),
                      SizedBox(height: 10.h),
                      _buildProfessionalInfoTile(
                        icon: Icons.badge_outlined,
                        title: 'ترخيص مزاولة المهنة',
                        subtitle: '123456',
                        isVerified: true,
                      ),
                      SizedBox(height: 10.h),
                      _buildProfessionalInfoTile(
                        icon: Icons.groups_outlined,
                        title: 'عضوية النقابة',
                        subtitle: '7890',
                        isVerified: true,
                      ),
                      SizedBox(height: 24.h),

                      // ---------- Reviews Section ----------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'تقييمات المرضى',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'عرض الكل',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      _buildReviewCard(
                        name: 'سارة محمود',
                        time: 'منذ يومين',
                        rating: 5.0,
                        comment:
                            'ممرض محترف جداً وخلوق، قدم الرعاية لوالدي بكل أمانة وإتقان، أنصح به بشدة',
                        service: 'الخدمة: رعاية كبار السن',
                      ),
                      SizedBox(height: 12.h),
                      _buildReviewCard(
                        name: 'خالد عبدالله',
                        time: 'منذ أسبوع',
                        rating: 4.5,
                        comment:
                            'دقيق في المواعيد ومهني في التعامل. شكراً جزيلاً على مجهودك.',
                        service: 'الخدمة: الحقن والمحاليل',
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),

              // ---------- Sticky Bottom Bar ----------
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.medical_services_outlined,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'تمريض منزلي',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'مدينة نصر، القاهرة',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '${widget.price} ج.م',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'خلال 15 دقيقة',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        onPressed: () {
                          goTo(
                            context,
                            page: ConfirmedBookingPage(
                              nurseName: widget.name,
                              rating: widget.rating,
                              imageUrl: widget.imageUrl,
                            ),
                          );
                        },
                        child: Text(
                          'تأكيد اختيار الممرض',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.borderGrey, width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'العودة للعروض',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
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

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.borderGrey.withOpacity(0.6),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 24.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(
              color: AppColors.hintGrey,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isVerified = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.borderGrey.withOpacity(0.6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.hintGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isVerified)
            Icon(
              Icons.check_circle,
              color: AppColors.primary,
              size: 22.sp,
            ),
        ],
      ),
    );
  }

  Widget _buildReviewCard({
    required String name,
    required String time,
    required double rating,
    required String comment,
    required String service,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.borderGrey.withOpacity(0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.borderGrey,
                    child: Icon(
                      Icons.person,
                      color: AppColors.hintGrey,
                      size: 22.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: const Color(0xFFFFB800),
                    size: 18.sp,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    '$rating',
                    style: TextStyle(
                      color: const Color(0xFFFFB800),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            comment,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xffF4F7F7),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              service,
              style: TextStyle(
                color: AppColors.hintGrey,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
