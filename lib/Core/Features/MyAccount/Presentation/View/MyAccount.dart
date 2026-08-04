import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/View/Sign_in.dart';
import 'package:nabdh/Core/Features/Message/Presentation/View/Message.dart';
import 'package:nabdh/Core/Features/MyBooking/Presentation/View/MyBooking.dart';
import 'package:nabdh/Core/Features/Notification/Presentation/View/Notifications.dart';
import 'package:nabdh/Core/Features/home/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class MyAccount extends StatefulWidget {
  final bool showBottomNav;

  const MyAccount({super.key, this.showBottomNav = true});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  int _selectedNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    Widget content = Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header: App Logo & Menu
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu, color: AppColors.primary, size: 26.sp),
                  onPressed: () {},
                ),
                SizedBox(width: 70.w),
                Text(
                  'NABDH',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Title & Subtitle
            Text(
              'حسابي',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'إدارة بياناتك الشخصية وإعدادات الحساب',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 48.h),

            // Welcome Green Card
            _buildWelcomeCard(),
            SizedBox(height: 48.h),

            // Personal Info Card
            _buildPersonalInfoCard(),
            SizedBox(height: 48.h),

            // Settings Title
            Text(
              'الإعدادات',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 24.h),

            // Settings Options List
            _buildSettingsList(context),
            SizedBox(height: 80.h),

            // Logout Button
            Center(child: _buildLogoutButton(context)),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );

    if (!widget.showBottomNav) {
      return content;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: content),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            // Decorative background circle in top-right
            Positioned(
              top: -30.h,
              right: -30.w,
              child: Container(
                width: 140.w,
                height: 140.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.07),
                ),
              ),
            ),
            // Card Content
            Padding(
              padding: EdgeInsets.all(48.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'مرحبًا، أحمد محمد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text('👋', style: TextStyle(fontSize: 20.sp)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'نتمنى لك دوام الصحة. يمكنك\nإدارة حسابك من هنا.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16.sp,
                      fontWeight: FontWeight(500),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Pulse Badge
                  Container(
                    width: 72.w,
                    height: 72.w, // Make sure width == height
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF9F9F9).withValues(alpha: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/MyAccountIcon.svg',
                        width: 40.w,
                        height: 32.h,
                        fit: BoxFit.contain,
                      ),
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

  Widget _buildPersonalInfoCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFEFF3F3), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.person_outline_rounded,
            label: 'الاسم الكامل',
            value: 'أحمد محمد بن عبدالله',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: const Divider(color: Color(0xFFF0F4F4), height: 1),
          ),
          _buildInfoRow(
            icon: Icons.phone_outlined,
            label: 'رقم الهاتف',
            value: '+966 50 123 4567',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: const Divider(color: Color(0xFFF0F4F4), height: 1),
          ),
          _buildInfoRow(
            icon: Icons.email_outlined,
            label: 'البريد الإلكتروني',
            value: 'ahmed.mohammed@nabdh.com',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: const Color(0xFFC7F3EC),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24.sp),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final settings = [
      {
        'title': 'تعديل البيانات الشخصية',
        'subtitle': 'تحديث صورتك ومعلوماتك الأساسية',
        'icon': Icons.edit_note_rounded,
        'onTap': () {},
      },
      {
        'title': 'الإشعارات',
        'subtitle': 'إدارة تنبيهات المواعيد والتقارير',
        'icon': Icons.notifications_none_rounded,
        'onTap': () {
          goTo(context, page: const NotificationsPage());
        },
      },
      {
        'title': 'المساعدة والدعم',
        'subtitle': 'تواصل معنا أو اقرأ الأسئلة الشائعة',
        'icon': Icons.help_outline_rounded,
        'onTap': () {},
      },
    ];

    return Column(
      children: settings.map((item) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFEFF3F3), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: item['onTap'] as void Function()?,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8EEEC),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: const Color(0xFF4A6560),
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            item['subtitle'] as String,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 14.sp,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goTo(context, page: const Signin(), state: NavAction.pushRemove);
      },
      child: Container(
        width: 280.w,
        height: 72.h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDC2626), width: 1.5),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_rounded,
              color: const Color(0xFFDC2626),
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'تسجيل الخروج',
              style: TextStyle(
                color: const Color(0xFFDC2626),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final navItems = const [
      _NavItemData(icon: Icons.home_outlined, label: 'الرئيسية'),
      _NavItemData(icon: Icons.calendar_month_outlined, label: 'حجوزاتي'),
      _NavItemData(icon: Icons.chat_bubble_outline, label: 'الرسائل'),
      _NavItemData(icon: Icons.person_outline, label: 'حسابي'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final isSelected = _selectedNavIndex == index;
              final item = navItems[index];

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      goTo(
                        context,
                        page: const HomePage(),
                        state: NavAction.pushRemove,
                      );
                    } else if (index == 1) {
                      goTo(
                        context,
                        page: const MyBookingPage(),
                        state: NavAction.pushReplace,
                      );
                    } else if (index == 2) {
                      goTo(
                        context,
                        page: const MessagePage(),
                        state: NavAction.pushReplace,
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
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFC7F3EC)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item.icon,
                            size: 22.sp,
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey[500],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            item.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10.sp,
                              height: 1,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isSelected
                                  ? AppColors.primary
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
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  const _NavItemData({required this.icon, required this.label});
}
