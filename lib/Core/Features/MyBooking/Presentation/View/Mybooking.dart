import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/Message/Presentation/View/Conversation.dart';
import 'package:nabdh/Core/Features/MyBooking/Presentation/View/BookingDetails.dart';
import 'package:nabdh/Core/Features/home/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class MyBookingPage extends StatefulWidget {
  final bool showBottomNav;

  const MyBookingPage({
    super.key,
    this.showBottomNav = true,
  });

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  int _selectedTab = 0; // 0: القادمة, 1: المجدولة, 2: السابقة
  int _selectedNavIndex = 1; // 1 represents "الحجوزات"

  final List<String> _tabs = const ['القادمة', 'المجدولة', 'السابقة'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              // Top Bar Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Avatar
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: const Color(0xFFEAF4F2),
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop',
                      ),
                    ),
                    // App Title
                    Text(
                      'NABDH',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      // Title & Subtitle
                      Text(
                        'حجوزاتي',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'استعرض جميع حجوزاتك وإدارة مواعيدك بسهولة.',
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Tab Switcher (القادمة - المجدولة - السابقة)
                      _buildTabSwitcher(),
                      SizedBox(height: 20.h),

                      // Booking Card / Content based on tab
                      if (_selectedTab == 0) ...[
                        _buildUpcomingBookingCard(),
                        SizedBox(height: 20.h),
                      ] else ...[
                        _buildEmptyTabCard(),
                        SizedBox(height: 20.h),
                      ],

                      // Add New Booking Card
                      _buildAddNewBookingCard(),
                      SizedBox(height: 20.h),

                      // Need Help Card Banner
                      _buildNeedHelpBanner(),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: widget.showBottomNav ? _buildBottomNavBar() : null,
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isSelected = _selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.hintGrey,
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildUpcomingBookingCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
          // Service Title & Icon Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تمريض منزلي',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'خدمة طبية منزلية',
                      style: TextStyle(
                        color: AppColors.hintGrey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF4F2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.primary,
                  size: 22.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Assigned Nurse Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الممرض المسئول',
                      style: TextStyle(
                        color: AppColors.hintGrey,
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'أحمد العتيبي',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=200&auto=format&fit=crop',
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 9.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Date & Time Boxes
          Row(
            children: [
              Expanded(
                child: _buildInfoPill(
                  label: 'التاريخ',
                  value: '25 مايو 2024',
                  icon: Icons.calendar_today_outlined,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildInfoPill(
                  label: 'الوقت',
                  value: '10:30 صباحاً',
                  icon: Icons.access_time_rounded,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: const Divider(color: Color(0xFFECECEC), height: 1),
          ),

          // Action Buttons: Chat & Details
          Row(
            children: [
              // Chat Button
              GestureDetector(
                onTap: () {
                  goTo(context, page: const ConversationPage());
                },
                child: Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F5F5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: AppColors.hintGrey,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              // Details Button
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      goTo(context, page: const BookingDetailsPage());
                    },
                    child: Text(
                      'تفاصيل الحجز',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoPill({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F6),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.hintGrey,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(icon, color: AppColors.primary, size: 15.sp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyTabCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE0E5E5)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 48.sp,
            color: const Color(0xFFB5C0C0),
          ),
          SizedBox(height: 12.h),
          Text(
            'لا توجد حجوزات في هذه القائمة حالياً',
            style: TextStyle(
              color: AppColors.hintGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewBookingCard() {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: const Color(0xFFC8D5D5),
        borderRadius: 16.r,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: Column(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F6F6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: AppColors.hintGrey,
                size: 26.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'حجز جديد',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'يمكنك إضافة رعاية طبية جديدة الآن بسهولة.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.hintGrey,
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF2F2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'ابدأ الآن',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNeedHelpBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'هل تحتاج للمساعدة؟',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'تواصل مع فريق الدعم الفني لمساعدتك في إدارة مواعيدك.',
            style: TextStyle(
              color: const Color(0xE6FFFFFF),
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'تحدث معنا',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final navItems = const [
      _NavItemData(icon: Icons.home_outlined, label: 'الرئيسية'),
      _NavItemData(icon: Icons.calendar_month, label: 'الحجوزات'),
      _NavItemData(icon: Icons.chat_bubble_outline, label: 'الرسائل'),
      _NavItemData(icon: Icons.person_outline, label: 'حسابي'),
    ];

    return SafeArea(
      top: false,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
        child: SizedBox(
          height: 56.h,
          child: Row(
            children: List.generate(navItems.length, (index) {
              final navItem = navItems[index];
              final isSelected = _selectedNavIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      goTo(
                        context,
                        page: const HomePage(),
                        state: NavAction.pushRemove,
                      );
                    } else {
                      setState(() {
                        _selectedNavIndex = index;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFEAF4F2) : Colors.transparent,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            navItem.icon,
                            size: 22.sp,
                            color: isSelected ? AppColors.primary : Colors.grey[500],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            navItem.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 1,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              color: isSelected ? AppColors.primary : Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  const _NavItemData({required this.icon, required this.label});
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;

  _DashedBorderPainter({required this.color, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final Path path = Path()..addRRect(rrect);
    final Path dashPath = Path();

    const double dashWidth = 6.0;
    const double dashSpace = 4.0;
    double distance = 0.0;

    for (final PathMetric metric in path.computeMetrics()) {
      while (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
