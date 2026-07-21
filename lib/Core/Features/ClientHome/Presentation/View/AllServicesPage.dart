import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabdh/Core/Util/app_colors.dart';

class AllServicesPage extends StatefulWidget {
  const AllServicesPage({super.key});

  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage> {
  int selectedNavIndex = 0;
  int? selectedServiceIndex;
  String selectedDate = 'الان'; // Services tab active

  final List<Map<String, dynamic>> services = [
    {
      'title': 'تمريض منزلي',
      'icon': SvgPicture.asset('assets/تمريض منزلي.svg'),
      'color': AppColors.primary,
    },
    {
      'title': 'حقن و محاليل',
      'icon': SvgPicture.asset('assets/حقن و محاليل.svg'),
      'color': AppColors.primary,
    },
    {
      'title': 'تغيير الضمادات',
      'icon': SvgPicture.asset('assets/تغير ضماضات.svg'),
      'color': AppColors.primary,
    },

    {
      'title': 'رعاية كبار السن',
      'icon': SvgPicture.asset('assets/رعايه كبار السن.svg'),
      'color': AppColors.primary,
    },

    {
      'title': 'رعاية ما بعد العمليات',
      'icon': SvgPicture.asset('assets/رعايه ما بعد العمليه.svg'),
      'color': AppColors.primary,
    },
    {
      'title': 'متابعة الحالات المزمنة',
      'icon': SvgPicture.asset('assets/متابعه الحالات المزمنه.svg'),
      'color': AppColors.primary,
    },
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

          title: Center(
            child: Text(
              'طلب خدمة',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.primary,
                size: 24.sp,
              ),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
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
                    'طلب خدمة',
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
                'املأ بيانات الطلب لإرسال طلب خدمة تمريض بسهولة.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.hintGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),

              // ---------- Search Bar ----------

              // ---------- Services Section Header ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'نوع الخدمة',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xff1A1C1C),
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
              SizedBox(height: 32.h),
              Text(
                'عنوان الخدمة',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1A1C1C),
                ),
              ),
              SizedBox(height: 16.h),

              Container(
                height: 85.h,

                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.borderGrey, width: 1),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                        'تغير',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color: Color(0xff1A1C1C),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'شارع النصر,مدينه,نصر,القاهره',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xff3E4947),
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

              Text(
                'نوع الطلب',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1A1C1C),
                ),
              ),
              SizedBox(height: 16.h),

              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffF4F3F3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = 'الان';
                            });
                          },
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: selectedDate == 'الان'
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'الان',
                                style: TextStyle(
                                  color: selectedDate == 'الان'
                                      ? AppColors.primary
                                      : AppColors.hintGrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      // Female Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = 'جدولة لاحقا';
                            });
                          },
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: selectedDate == 'جدولة لاحقا'
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'جدولة لاحقا',
                                style: TextStyle(
                                  color: selectedDate == 'جدولة لاحقا'
                                      ? AppColors.primary
                                      : AppColors.hintGrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'ملاحظات اضافية',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'اكتب اي تفاصيل قد تساعد الممرض اثناء تقديم الخدمه',
                  hintStyle: TextStyle(
                    color: AppColors.hintGrey.withOpacity(0.5),
                    fontSize: 16.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Color(0xffBEC9C6).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 72.h),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send, color: Colors.white, size: 20.sp),
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

              // ---------- Floating Action Button Info ----------
            ],
          ),
        ),
      ),
    );
  }
}
