import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color primaryTeal = Color(0xFF00685F);
  static const Color backgroundGrey = Color(0xFFF7F8FA);
  static const Color borderGrey = Color(0xFFE3E6EA);
  static const Color hintGrey = Color(0xFF3E4947);

  int selectedNavIndex = 0; // Services tab active

  final List<Map<String, dynamic>> services = [
    {
      'title': 'تمريض منزلي',
      'icon': SvgPicture.asset('assets/تمريض منزلي.svg'),
      'color': primaryTeal,
    },
    {
      'title': 'حقن و محاليل',
      'icon': SvgPicture.asset('assets/حقن و محاليل.svg'),
      'color': primaryTeal,
    },
    {
      'title': 'تغيير الضمادات',
      'icon': SvgPicture.asset('assets/تغير ضماضات.svg'),
      'color': Colors.grey[300],
    },

    {
      'title': 'رعاية كبار السن',
      'icon': SvgPicture.asset('assets/رعايه كبار السن.svg'),
      'color': primaryTeal,
    },

    {
      'title': 'رعاية ما بعد العمليات',
      'icon': SvgPicture.asset('assets/رعايه ما بعد العمليه.svg'),
      'color': Colors.grey[300],
    },
    {
      'title': 'متابعة الحالات المزمنة',
      'icon': SvgPicture.asset('assets/متابعه الحالات المزمنه.svg'),
      'color': Colors.red[300],
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
              color: primaryTeal,
              fontSize: 28.sp,
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
                  color: hintGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),

              // ---------- Search Bar ----------
              TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'ابحث عن خدمة تمريضية',
                  hintStyle: TextStyle(color: hintGrey, fontSize: 16.sp),
                  prefixIcon: Icon(Icons.search, color: hintGrey),
                  filled: true,
                  fillColor: backgroundGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: borderGrey, width: 1),
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
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: primaryTeal,
                      fontWeight: FontWeight.w600,
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
                  return GestureDetector(
                    onTap: () {
                      // Handle service tap
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: borderGrey, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: services[index]['color'],
                              shape: BoxShape.circle,
                            ),
                            child: services[index]['icon'],
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
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
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
                      height: 62.h,
                      decoration: BoxDecoration(
                        color: isSelected ? primaryTeal : Colors.transparent,
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            navItem.icon,
                            size: 26.sp,
                            color: isSelected
                                ? Color(0xff93E4D8)
                                : Colors.grey[500],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            navItem.label,
                            style: TextStyle(
                              fontSize: 12.sp,
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
