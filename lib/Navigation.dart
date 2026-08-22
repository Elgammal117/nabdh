import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/Message/Presentation/View/Message.dart';
import 'package:nabdh/Core/Features/MyAccount/Presentation/View/MyAccount.dart';
import 'package:nabdh/Core/Features/MyBooking/Presentation/View/Mybooking.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Util/app_colors.dart';

class MainScreen extends StatefulWidget {
  final String? accessToken;
  const MainScreen({super.key, this.accessToken});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 3;

  final List<_NavItemData> navItems = const [
    _NavItemData(icon: Icons.person_outline, label: 'حسابي'),
    _NavItemData(icon: Icons.chat_bubble_outline, label: 'الرسائل'),
    _NavItemData(icon: Icons.calendar_month, label: 'الحجوزات'),
    _NavItemData(icon: Icons.home, label: 'الرئيسية'),
  ];
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const MyAccount(),
      const MessagePage(),
      const MyBookingPage(),
      HomePage(accessToken: widget.accessToken!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
          child: SizedBox(
            height: 56.h,
            child: Row(
              children: List.generate(navItems.length, (index) {
                final navItem = navItems[index];
                final isSelected = currentIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOut,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              navItem.icon,
                              size: 22.sp,
                              color: isSelected
                                  ? Color(0xff93E4D8)
                                  : Colors.grey[500],
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              navItem.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10.sp,
                                height: 1,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Color(0xff93E4D8)
                                    : Colors.grey[500],
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
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  const _NavItemData({required this.icon, required this.label});
}
