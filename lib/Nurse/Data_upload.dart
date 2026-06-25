import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataCheckPage extends StatelessWidget {
  const DataCheckPage({super.key});

  static const Color primaryTeal = Color(0xFF00685F);
  static const Color textDark = Color(0xFF3F4B49);
  static const Color borderGrey = Color(0xFFD4DBDA);
  static const Color lightGrey = Color(0xFFF4F6F7);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward, color: primaryTeal, size: 24.sp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          title: Text(
            'التحقق من البيانات',
            style: TextStyle(
              color: primaryTeal,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 24.h),
                  child: Column(
                    children: [
                      _SectionTitle(
                        title: 'التحقق من بياناتك المهنية',
                        subtitle:
                            'لضمان سلامة المرضى وجودة الخدمات، نحتاج إلى التحقق من هويتك ومستنداتك المهنية.',
                      ),
                      SizedBox(height: 22.h),
                      const _InfoBox(
                        text:
                            'سيتم مراجعة المستندات من قبل فريق نبض قبل تفعيل حسابك واستقبال طلبات المرضى.',
                      ),
                      SizedBox(height: 28.h),
                      _SectionTitle(
                        title: 'الصورة الشخصية',
                        subtitle: 'قم بإضافة صورة شخصية احترافية تظهر بوضوح.',
                      ),
                      SizedBox(height: 18.h),
                      const _AvatarPicker(),
                      SizedBox(height: 28.h),
                      _SectionTitle(
                        title: 'بطاقة الرقم القومي',
                        subtitle:
                            'يرجى رفع صورة واضحة للبطاقة من الأمام والخلف للتحقق من الهوية.',
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        children: const [
                          Expanded(
                            child: _UploadOptionCard(
                              label: 'وجه البطاقة (أمام)',
                              icon: Icons.photo_camera_outlined,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _UploadOptionCard(
                              label: 'وجه البطاقة (خلف)',
                              icon: Icons.photo_camera_outlined,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.h),
                      _SectionTitle(
                        title: 'كارنيه النقابة أو ترخيص مزاولة المهنة',
                        subtitle:
                            'قم برفع صورة واضحة لكارنيه النقابة أو مستند رسمي يثبت صلاحية ممارسة مهنة التمريض.',
                      ),
                      SizedBox(height: 18.h),
                      const _UploadDocumentCard(),
                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryTeal,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send_outlined,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'إرسال للمراجعة',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
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
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: DataCheckPage.primaryTeal,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: DataCheckPage.textDark,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String text;

  const _InfoBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Color(0xff004E47).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xff004E47).withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: const BoxDecoration(
              color: DataCheckPage.primaryTeal,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.info, color: Colors.white, size: 16),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xff3E4947),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarPicker extends StatelessWidget {
  const _AvatarPicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120.w,
        height: 120.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 120.w,
              height: 120.w,
              decoration: const BoxDecoration(
                color: Color(0xFFF1F2F3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_outline,
                size: 56.sp,
                color: const Color(0xFFC7CBCD),
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 4.w,
              child: Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: DataCheckPage.primaryTeal,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadOptionCard extends StatelessWidget {
  final String label;
  final IconData icon;

  const _UploadOptionCard({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: DataCheckPage.borderGrey,
          width: 1.4,
          style: BorderStyle.solid,
        ),
      ),
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: const Color(0xFFB9C4C2),
          radius: 16.r,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30.sp, color: DataCheckPage.primaryTeal),
              SizedBox(height: 14.h),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: DataCheckPage.textDark,
                  fontSize: 15.sp,
                  height: 1.35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UploadDocumentCard extends StatelessWidget {
  const _UploadDocumentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: DataCheckPage.borderGrey, width: 1.4),
      ),
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: const Color(0xFFB9C4C2),
          radius: 16.r,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 54.w,
                height: 54.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F7F6),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: const Icon(
                  Icons.badge_outlined,
                  color: DataCheckPage.primaryTeal,
                  size: 40,
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                'رفع المستند المهني',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff1A1C1C),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'PDF, JPG, PNG (Max 5MB)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF5E6765),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
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
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.8),
      Radius.circular(radius),
    );
    const dashWidth = 7.0;
    const dashSpace = 5.0;

    void drawDashedPath(Path path) {
      for (final metric in path.computeMetrics()) {
        var distance = 0.0;
        while (distance < metric.length) {
          final next = distance + dashWidth;
          canvas.drawPath(
            metric.extractPath(distance, next.clamp(0.0, metric.length)),
            paint,
          );
          distance += dashWidth + dashSpace;
        }
      }
    }

    drawDashedPath(Path()..addRRect(rrect));
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
