import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageController,
    required this.pageCount,
    required this.isLastPage,
    required this.onNext,
  });

  final String image;
  final String title;
  final String description;
  final PageController pageController;
  final int pageCount;
  final bool isLastPage;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ---------- Image ----------
          Container(
            width: double.infinity,
            height: 540.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.image_outlined,
                          size: 64.sp,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white.withOpacity(0), Colors.white],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.h),

          // ---------- White rounded content card ----------
          Transform.translate(
            offset: Offset(0, -40.h),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 53.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff00685F),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff576060), fontSize: 16.sp),
                  ),
                  SizedBox(height: 40.h),

                  // ---------- Smooth page indicator ----------
                  SmoothPageIndicator(
                    controller: pageController,
                    count: pageCount,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      expansionFactor: 3,
                      activeDotColor: const Color(0xff00685F),
                      dotColor: const Color(0xffD9D9D9),
                      spacing: 6.w,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // ---------- Next / Start button ----------
                  Container(
                    width: 290.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff00685F),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18.r),
                      onTap: onNext,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.ltr,
                        children: [
                          Text(
                            isLastPage ? 'ابدأ' : 'التالي',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            isLastPage
                                ? Icons.check_circle_outline
                                : Icons.chevron_right,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
