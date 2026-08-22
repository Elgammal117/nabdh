import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabdh/Core/Features/Notification/Presentation/View/Notifications.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/Cubit/home_cubit.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/Cubit/home_state.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/View/FindingNurse.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/View/Location.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class HomePage extends StatelessWidget {
  final String accessToken;
  const HomePage({super.key, this.accessToken = ""});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(accessToken: accessToken)..loadUserData(),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final int visibleCount = cubit.showAllServices
            ? cubit.services.length
            : 4;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
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
                  onPressed: () {
                    goTo(context, page: const NotificationsPage());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.black87, size: 24.sp),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              controller: cubit.scrollController,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Greeting ──
                  Row(
                    children: [
                      Text(
                        'مرحباً، ${cubit.userName}',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff1A1C1C),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text('👋', style: TextStyle(fontSize: 24.sp)),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'كيف يمكننا مساعدتك اليوم؟',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.hintGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ── Search Bar ──
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Color(0xffBEC9C6),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 37.h),

                  // ── Services Header ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الخدمات المتاحة',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xff1A1C1C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => cubit.toggleServicesVisibility(),
                        child: Text(
                          cubit.showAllServices ? 'عرض أقل' : 'عرض الكل',
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

                  // ── Services Grid ──
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                    ),
                    itemCount: visibleCount,
                    itemBuilder: (context, index) {
                      final isSelected = cubit.selectedServiceIndex == index;
                      return GestureDetector(
                        onTap: () => cubit.selectService(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xffF0F7F6)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.borderGrey,
                              width: isSelected ? 1.5 : 1,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(
                                        0.08,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xffA1F1E5,
                                  ).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    cubit.services[index]['asset'] as String,
                                    width: 30.w,
                                    height: 30.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                cubit.services[index]['title'] as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // ── Request Form (visible only after service is selected) ──
                  if (cubit.selectedServiceIndex != null) ...[
                    SizedBox(height: 32.h),
                    Container(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Divider with selected service name
                          Row(
                            children: [
                              Expanded(
                                child: Divider(color: AppColors.borderGrey),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  cubit.services[cubit
                                          .selectedServiceIndex!]['title']
                                      as String,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(color: AppColors.borderGrey),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),

                          // ── عنوان الخدمة ──
                          Text(
                            'عنوان الخدمة',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1A1C1C),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            height: 85.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: AppColors.borderGrey,
                                width: 1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: () => goTo(
                                      context,
                                      page: const LocationPage(),
                                    ),
                                    child: Text(
                                      'تغيير',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home_outlined,
                                      color: AppColors.primary,
                                      size: 30.sp,
                                    ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: AppColors.hintGrey,
                                              size: 24.sp,
                                            ),
                                            Text(
                                              'المنزل',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: const Color(0xff1A1C1C),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'شارع النصر، مدينة نصر، القاهرة',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: const Color(0xff3E4947),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h),

                          // ── نوع الطلب ──
                          Text(
                            'نوع الطلب',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1A1C1C),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0xffF4F3F3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  _RequestTypeButton(
                                    label: 'الان',
                                    selected:
                                        cubit.selectedRequestType == 'الان',
                                    onTap: () => cubit.setRequestType('الان'),
                                  ),
                                  SizedBox(width: 8.w),
                                  _RequestTypeButton(
                                    label: 'جدولة لاحقاً',
                                    selected:
                                        cubit.selectedRequestType ==
                                        'جدولة لاحقاً',
                                    onTap: () =>
                                        cubit.setRequestType('جدولة لاحقاً'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),

                          // ── ملاحظات إضافية ──
                          Text(
                            'ملاحظات إضافية',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: cubit.notesController,
                            maxLines: 4,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText:
                                  'اكتب أي تفاصيل قد تساعد الممرض أثناء تقديم الخدمة',
                              hintStyle: TextStyle(
                                color: AppColors.hintGrey.withOpacity(0.5),
                                fontSize: 14.sp,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: const Color(
                                    0xffBEC9C6,
                                  ).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),

                          // ── ارسال الطلب ──
                          GestureDetector(
                            onTap: () =>
                                goTo(context, page: const FindingNursePage()),
                            child: Container(
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'ارسال الطلب',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
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
                  ] else ...[
                    SizedBox(height: 34.h),

                    // ── Promo Card ──
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/Promo_bg.png',
                            height: 250.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(
                              height: 250.h,
                              width: double.infinity,
                              color: Colors.transparent,
                            ),
                          ),
                          Container(
                            height: 250.h,
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

                    // ── SOS FAB ──
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999.r),
                        ),
                        elevation: 0,
                        onPressed: () {},
                        backgroundColor: const Color(0xffdc2626),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ── Request Type Toggle Button ──
class _RequestTypeButton extends StatelessWidget {
  const _RequestTypeButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50.h,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.primary : AppColors.hintGrey,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
