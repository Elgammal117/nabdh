import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/home/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class ReviewPage extends StatefulWidget {
  final String nurseName;
  final String serviceTitle;
  final String date;
  final String duration;
  final String imageUrl;

  const ReviewPage({
    super.key,
    this.nurseName = 'أحمد العتيبي',
    this.serviceTitle = 'تمريض منزلي',
    this.date = 'اليوم',
    this.duration = 'ساعة و30 دقيقة',
    this.imageUrl =
        'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&auto=format&fit=crop',
  });

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _selectedRating = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              // Top Header Bar with Close Icon and Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: AppColors.primary,
                        size: 24.sp,
                      ),
                    ),
                    Text(
                      'NABDH',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(width: 48.w), // Balance layout
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),

                      // Headline Title & Subtitle
                      Text(
                        'كيف كانت تجربتك؟',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'ساعدنا في تحسين جودة الخدمات من\nخلال مشاركة تقييمك.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Nurse Summary Card
                      _buildNurseSummaryCard(),
                      SizedBox(height: 32.h),

                      // Rating Card
                      _buildRatingCard(),
                      SizedBox(height: 32.h),

                      // Comment Input Section
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'أضف تعليقاً (اختياري)',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      _buildCommentTextField(),
                      SizedBox(height: 40.h),

                      // Confidentiality Info Box
                      _buildInfoNoteBox(),
                      SizedBox(height: 48.h),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: Column(
                          children: [
                            // Submit Review Button
                            SizedBox(
                              width: double.infinity,
                              height: 80.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
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
                                  'إرسال التقييم',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),

                            // Skip Text Button
                            TextButton(
                              onPressed: () {
                                goTo(
                                  context,
                                  page: const HomePage(),
                                  state: NavAction.pushRemove,
                                );
                              },
                              child: Text(
                                'تخطي',
                                style: TextStyle(
                                  color: AppColors.hintGrey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
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

              // Bottom Action Buttons (Submit & Skip)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNurseSummaryCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE0E5E5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with Verified Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Image.network(
                  widget.imageUrl,
                  width: 56.w,
                  height: 56.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 56.w,
                    height: 56.w,
                    color: const Color(0xFFEAF4F2),
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
                  padding: EdgeInsets.all(1.w),
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
                    child: Icon(Icons.check, color: Colors.white, size: 11.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 14.w),

          // Nurse & Booking Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nurseName,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.add_box_outlined,
                      color: AppColors.hintGrey,
                      size: 14.sp,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      widget.serviceTitle,
                      style: TextStyle(
                        color: AppColors.hintGrey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.hintGrey,
                      size: 13.sp,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      widget.date,
                      style: TextStyle(
                        color: AppColors.hintGrey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: AppColors.hintGrey,
                      size: 14.sp,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      widget.duration,
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
    );
  }

  Widget _buildRatingCard() {
    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE0E5E5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'ما مدى رضاك عن الخدمة؟',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              final isFilled = starIndex <= _selectedRating;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = starIndex;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Icon(
                    isFilled ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: isFilled
                        ? const Color(0xFFFFB800)
                        : const Color(0xFFD0D7D7),
                    size: 38.sp,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE0E5E5)),
      ),
      child: TextField(
        controller: _commentController,
        maxLines: 4,
        style: TextStyle(color: AppColors.black, fontSize: 14.5.sp),
        decoration: InputDecoration(
          hintText: 'اكتب ملاحظاتك أو شارك تجربتك مع الخدمة.',
          hintStyle: TextStyle(
            color: const Color(0xFFA0AAAA),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.all(14.w),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildInfoNoteBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6F6),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'ملاحظاتك تساعدنا في ضمان تقديم أعلى معايير الجودة لجميع مستخدمي نبض. يتم التعامل مع تقييمك بسرية تامة.',
              style: TextStyle(
                color: AppColors.hintGrey,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
