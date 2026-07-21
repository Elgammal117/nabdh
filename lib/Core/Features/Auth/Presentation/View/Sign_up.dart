import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/ClientHome/Presentation/View/UserHome.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  static const Color primaryTeal = Color(0xFF00685F);
  static const Color backgroundGrey = Color(0xFFF7F8FA);
  static const Color borderGrey = Color(0xFFE3E6EA);
  static const Color hintGrey = Color(0xFF3E4947);

  String selectedGender = 'male'; // 'male' or 'female'

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            // ---------- Back Button and Logo Header ----------
            Padding(
              padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NABDH',
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.black87,
                      size: 24.sp,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // ---------- Subtitle ----------
                  Text(
                    'ابدأ رحلتك معنا بيقش للوصول إلى خدمات\nتمريضية منزلية موثوقة وآمنة.',
                    style: TextStyle(
                      color: hintGrey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // ---------- First Name Label ----------
                  Text(
                    'الاسم الأول',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // ---------- First Name Field ----------
                  TextFormField(
                    controller: _firstNameController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسمك الأول',
                      hintStyle: TextStyle(color: hintGrey, fontSize: 14.sp),
                      prefixIcon: Icon(Icons.person, color: hintGrey),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Color(0xffBEC9C6).withOpacity(0.6),
                          width: 1.5,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: primaryTeal, // color when clicking
                          width: 1.5,
                        ),
                      ),

                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  // ---------- Last Name Label ----------
                  Text(
                    'الاسم الأخير',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // ---------- Last Name Field ----------
                  TextFormField(
                    controller: _lastNameController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسمك الأخير',
                      hintStyle: TextStyle(color: hintGrey, fontSize: 14.sp),
                      prefixIcon: Icon(Icons.person, color: hintGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Color(0xffBEC9C6).withOpacity(0.6),
                          width: 1.5,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Color(0xffBEC9C6).withOpacity(0.6),
                          width: 1.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 34.h),

                  // ---------- Gender Label ----------
                  Text(
                    'الجنس',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // ---------- Gender Selection Buttons ----------
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: backgroundGrey,
                    ),
                    height: 50.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(4.0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Male Button
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'male';
                                });
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: selectedGender == 'male'
                                      ? primaryTeal
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'ذكر',
                                    style: TextStyle(
                                      color: selectedGender == 'male'
                                          ? Colors.white
                                          : hintGrey,
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
                                  selectedGender = 'female';
                                });
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: selectedGender == 'female'
                                      ? primaryTeal
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'أنثى',
                                    style: TextStyle(
                                      color: selectedGender == 'female'
                                          ? Colors.white
                                          : hintGrey,
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
                  SizedBox(height: 200.h),

                  // ---------- Continue Button ----------
                  GestureDetector(
                    onTap: () {
                      // Handle continue action
                      if (_firstNameController.text.isEmpty ||
                          _lastNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('يرجى ملء جميع الحقول'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                        // Navigate to next screen
                        print('First Name: ${_firstNameController.text}');
                        print('Last Name: ${_lastNameController.text}');
                        print('Gender: $selectedGender');
                      }
                    },
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: primaryTeal,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'متابعة',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ---------- Title ----------
          ],
        ),
      ),
    );
  }
}
