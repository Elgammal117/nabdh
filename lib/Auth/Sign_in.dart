import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Auth/Otp.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _phoneController = TextEditingController();

  static const Color primaryTeal = Color(0xFF00685F);
  static const Color backgroundGrey = Color(0xFFF7F8FA);
  static const Color borderGrey = Color(0xFFE3E6EA);
  static const Color hintGrey = Color(0xFF3E4947);
  bool onpressed1 = true;
  bool onpressed2 = true;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 36.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------- Logo ----------
              Center(
                child: Image.asset(
                  'assets/NABDH Premium Logo.png',
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8.h),

              // ---------- Title ----------
              Text(
                'مرحباً بعودتك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryTeal,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),

              // ---------- Subtitle ----------
              Text(
                'سجل الدخول للوصول إلى خدمات التمريض\nالمنزلي بسهولة وأمان.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff3E4947), fontSize: 16.sp),
              ),
              SizedBox(height: 40.h),
              Text(
                'نوع المستخدم',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff3E4947),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0xffF4F3F3),
                ),
                height: 50.h,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            onpressed1 = true;
                            onpressed2 = false;
                            setState(() {});
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: onpressed1
                                  ? primaryTeal
                                  : Color(0xffF4F3F3),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Text(
                                'مريض',
                                style: TextStyle(
                                  color: onpressed1 ? Colors.white : hintGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            onpressed2 = true;
                            onpressed1 = false;
                            setState(() {});
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: onpressed2
                                  ? primaryTeal
                                  : Color(0xffF4F3F3),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Text(
                                'ممرض',
                                style: TextStyle(
                                  color: onpressed2 ? Colors.white : hintGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
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
              SizedBox(height: 24.h),

              // ---------- Phone label ----------
              Text(
                'رقم الهاتف المحمول',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff3E4947),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.h),

              // ---------- Phone input ----------
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: borderGrey),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 14.w),
                    Container(width: 1.w, height: 26.h, color: borderGrey),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                          ),
                          hintText: 'ادخل رقم الهاتف المحمول',
                          hintStyle: TextStyle(
                            color: hintGrey.withOpacity(0.6),
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '20+',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 18.w),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // ---------- Continue button ----------
              SizedBox(
                height: 58.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpVerification(phoneNumber: _phoneController.text),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTeal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        'متابعة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28.h),

              // ---------- Feature pills ----------
              _FeaturePill(
                label: 'ممرضون معتمدون',
                icon: Icons.check,
                primaryTeal: primaryTeal,
                borderGrey: borderGrey,
              ),
              SizedBox(height: 14.h),
              _FeaturePill(
                label: 'خدمات آمنة',
                icon: Icons.verified_user_outlined,
                primaryTeal: primaryTeal,
                borderGrey: borderGrey,
              ),
              SizedBox(height: 14.h),
              _FeaturePill(
                label: 'استجابة سريعة',
                icon: Icons.bolt,
                primaryTeal: primaryTeal,
                borderGrey: borderGrey,
              ),
              SizedBox(height: 64.h),

              // ---------- Footer links ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الشروط والأحكام',
                    style: TextStyle(color: Color(0xffBEC9C6), fontSize: 13.sp),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '•',
                    style: TextStyle(color: Color(0xffBEC9C6), fontSize: 13.sp),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'سياسة الخصوصية',
                    style: TextStyle(color: Color(0xffBEC9C6), fontSize: 13.sp),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Feature pill row ----------
class _FeaturePill extends StatelessWidget {
  const _FeaturePill({
    required this.label,
    required this.icon,
    required this.primaryTeal,
    required this.borderGrey,
  });

  final String label;
  final IconData icon;
  final Color primaryTeal;
  final Color borderGrey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Color(0xffBEC9C6).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: Color(0xff00685F).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryTeal, size: 16.sp),
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              color: Color(0xff576060),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
