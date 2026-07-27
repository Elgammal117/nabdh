import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'dart:ui' as ui;

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int selectedAddressIndex = 0;

  final List<_SavedAddressData> savedAddresses = const [
    _SavedAddressData(
      title: 'المنزل',
      subtitle: 'شارع النصر، مدينة نصر، القاهرة',
      icon: Icons.home_outlined,
    ),
    _SavedAddressData(
      title: 'العمل',
      subtitle: 'التجمع الخامس، القاهرة، مصر',
      icon: Icons.work_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          centerTitle: false,
          leadingWidth: 56.w,

          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'حدد موقع الخدمة',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                Text(
                  'اختر الموقع الذي ترغب في استقبال الخدمة\n التمريضية فيه.',
                  style: TextStyle(
                    color: AppColors.hintGrey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.primary,
                size: 28.sp,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Map Section
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: SizedBox(
                        height: 480.h,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/Map.png',
                                fit: BoxFit.contain,
                              ),
                            ),

                            // Zoom Controls
                            Positioned(
                              left: 16.w,
                              top: 50.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.primary,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 32.w,
                                      height: 1,
                                      color: Colors.grey[200],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColors.primary,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Current Location Card
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  12.w,
                                  0,
                                  12.w,
                                  16.h,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 16,
                                        offset: Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'موقعي الحالي',
                                                  style: TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(width: 6.w),
                                                Text(
                                                  '📍',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.h),
                                            Text(
                                              'استخدم موقعك الحالي لتحديد مكان تقديم الخدمة بشكل تلقائي ودقيق.',
                                              style: TextStyle(
                                                color: AppColors.hintGrey,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 44.h,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: AppColors
                                                      .primary
                                                      .withOpacity(0.08),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12.r,
                                                        ),
                                                  ),
                                                ),
                                                child: Text(
                                                  'استخدام موقعي الحالي',
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Container(
                                        width: 52.w,
                                        height: 52.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            0.12,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.my_location,
                                          color: AppColors.primary,
                                          size: 26.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Saved Addresses Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'العناوين المحفوظة',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'تعديل',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Saved Addresses List
                    Column(
                      children: List.generate(savedAddresses.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index == savedAddresses.length - 1
                                ? 0
                                : 12.h,
                          ),
                          child: _SavedAddressCard(
                            data: savedAddresses[index],
                            isSelected: selectedAddressIndex == index,
                            onTap: () {
                              setState(() {
                                selectedAddressIndex = index;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 16.h),

                    // Add New Address Button
                    _AddNewAddressCard(onTap: () {}),
                  ],
                ),
              ),
            ),

            // Bottom Fixed Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.scaffoldBackground,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'تأكيد الموقع',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
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

class _SavedAddressData {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SavedAddressData({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class _SavedAddressCard extends StatelessWidget {
  final _SavedAddressData data;
  final bool isSelected;
  final VoidCallback onTap;

  const _SavedAddressCard({
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
            width: 1.5,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.05),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Icon(data.icon, size: 28.sp, color: AppColors.primary),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text('📍', style: TextStyle(fontSize: 14.sp)),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    data.subtitle,
                    style: TextStyle(
                      color: AppColors.hintGrey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddNewAddressCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddNewAddressCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(color: Colors.grey[400]!, radius: 16.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_location_alt_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'إضافة عنوان جديد',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;

  _DashedBorderPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);

    final dashWidth = 6.0;
    final dashSpace = 4.0;

    Path dashedPath = Path();
    for (ui.PathMetric measurePath in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < measurePath.length) {
        dashedPath.addPath(
          measurePath.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) => false;
}
