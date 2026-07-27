import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/View/AllServicesPage.dart';
import 'dart:ui';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNavIndex = 0; // Services tab active
  int? selectedServiceIndex;
  final List<Map<String, dynamic>> services = [
    {
      'title': 'تمريض منزلي',
      'icon': SvgPicture.asset(
        'assets/تمريض منزلي.svg',
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
      'color': AppColors.primary,
    },
    {
      'title': 'حقن و محاليل',
      'icon': SvgPicture.asset(
        'assets/حقن و محاليل.svg',
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
      'color': AppColors.primary,
    },
    {
      'title': 'تغيير الضمادات',
      'icon': SvgPicture.asset(
        'assets/تغير ضماضات.svg',
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
      'color': AppColors.primary,
    },

    {
      'title': 'رعاية كبار السن',
      'icon': SvgPicture.asset(
        'assets/رعايه كبار السن.svg',
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
      'color': AppColors.primary,
    },

    {
      'title': 'رعاية ما بعد العمليات',
      'icon': SvgPicture.asset(
        'assets/رعايه ما بعد العمليه.svg',
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
      'color': AppColors.primary,
    },
    {
      'title': 'متابعة الحالات المزمنة',
      'icon': SvgPicture.asset(
        'assets/متابعه الحالات المزمنه.svg',
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
      'color': AppColors.primary,
    },
  ];

  final List<_NavItemData> navItems = const [
    _NavItemData(icon: Icons.home, label: 'الرئيسية'),
    _NavItemData(icon: Icons.calendar_month, label: 'طلباتي'),
    _NavItemData(icon: Icons.chat_bubble_outline, label: 'الرسائل'),
    _NavItemData(icon: Icons.person_outline, label: 'حسابي'),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,

          title: Text(
            'NABDH',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black87,
                size: 24.sp,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black87, size: 24.sp),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------- Greeting Section ----------
              Row(
                children: [
                  Text(
                    'مرحباً، مريم',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1A1C1C),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text('👋', style: TextStyle(fontSize: 24.sp)),
                ],
              ),
              SizedBox(height: 8.h),

              // ---------- Subtitle ----------
              Text(
                'كيف يمكننا مساعدتك اليوم؟',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.hintGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),

              // ---------- Search Bar ----------
              TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'ابحث عن خدمة تمريضية',
                  hintStyle: TextStyle(
                    color: AppColors.hintGrey,
                    fontSize: 16.sp,
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.hintGrey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.borderGrey,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Color(0xffBEC9C6), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
              SizedBox(height: 37.h),

              // ---------- Services Section Header ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الخدمات المتاحة',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xff1A1C1C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      goTo(context, page: AllServicesPage());
                    },
                    child: Text(
                      'عرض الكل',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // ---------- Services Grid ----------
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedServiceIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedServiceIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xffF0F7F6) : Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.borderGrey,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: Color(0xffA1F1E5).withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: services[index]['icon']),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            services[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 34.h),

              // ---------- Promo Card ----------
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Promo_bg.png',
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    // blur layer
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        height: 200.h,
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                    ),

                    // gradient layer
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            const Color(0xff004E47).withOpacity(0.8),
                            const Color(0xff004E47).withOpacity(0),
                          ],
                        ),
                      ),
                    ),

                    // content
                    Padding(
                      padding: EdgeInsets.only(right: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Container(
                            height: 24.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999.r),
                              color: Colors.white.withAlpha(150),
                            ),
                            child: Center(
                              child: Text(
                                'تصحيح اليوم',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "اهمية شرب\nالماء للمرضى\n بعد الجراحة",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // ---------- Floating Action Button Info ----------
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999.r),
                  ),
                  elevation: 0,
                  onPressed: () {},
                  backgroundColor: Color(0xffdc2626),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/SOS.svg"),
                      Text(
                        "SOS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
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
                  final isSelected = selectedNavIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedNavIndex = index;
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
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  const _NavItemData({required this.icon, required this.label});
}
