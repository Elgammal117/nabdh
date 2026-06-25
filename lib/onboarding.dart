import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Auth/Sign_in.dart';
import 'Widgets/Introduction.dart';

class OnboardingPageData {
  const OnboardingPageData({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const _pages = [
    OnboardingPageData(
      image: 'assets/LuxeHealth home nursing.png',
      title: 'خدمات تمريض منزليّة موثوقة',
      description:
          'احصل على رعاية تمريضية احترافية داخل منزلك من خلال ممرضين معتمدين ومدربين لتقديم أفضل مستوى من الرعاية الصحية.',
    ),
    OnboardingPageData(
      image: 'assets/Healthcare professionals interface mockup.png',
      title: 'اختار الممرض المناسب لك',
      description:
          "استقبل عروضاً من أكثر من ممرض وقارن بين الأسعار والتقييمات والخبرات لاختيار الأنسب لاحتياجاتك.",
    ),
    OnboardingPageData(
      image: 'assets/Image.png',
      title: 'مساعدة فوريه في حالات الطوارئ',
      description:
          "في الحالات العاجلة يمكنك إرسال طلب SOS ليتم إشعار أقرب الممرضين المتاحين والوصول إليك بأسرع وقت ممكن",
    ),
  ];

  void _handleNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
        (route) => false,
      );
    }
  }

  void _handleSkip() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Signin()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final page = _pages[index];
                return OnboardingContent(
                  image: page.image,
                  title: page.title,
                  description: page.description,
                  pageController: _pageController,
                  pageCount: _pages.length,
                  isLastPage: index == _pages.length - 1,
                  onNext: _handleNext,
                );
              },
            ),

            // ---------- Skip button (shared across pages) ----------
            Positioned(
              top: MediaQuery.of(context).padding.top + 16.h,
              left: 16.w,
              child: GestureDetector(
                onTap: _handleSkip,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B7280).withOpacity(0.13),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      color: const Color(0xFF00685F),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
