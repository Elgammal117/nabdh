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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: ListView(
            children: [
              Column(children: []),
              // ─── Top status card ───────────────────────────────────────
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: borderGrey, width: 1),
                ),
                child: Column(
                  children: [
                    // Badge
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: const Color(0xFFF97316),
                          size: 16.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'قيد المراجعة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFF97316),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Title
                    Text(
                      'تم استلام مستنداتك\nبنجاح',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A1C1C),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Description
                    Text(
                      'تم إرسال مستنداتك إلى فريق نبض للتحقق من الهوية والبيانات المهنية. سيتم إشعارك فور الانتهاء من عملية المراجعة.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff3E4947),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // ─── Verification stages card ──────────────────────────────
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: borderGrey, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مراحل التحقق',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1A1C1C),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _StageItem(
                      title: 'تم استلام المستندات',
                      subtitle: 'مكتمل',
                      status: _StageStatus.done,
                      isLast: false,
                    ),
                    _StageItem(
                      title: 'مراجعة المستندات',
                      subtitle: 'جاري العمل حاليا',
                      status: _StageStatus.inProgress,
                      isLast: false,
                    ),
                    _StageItem(
                      title: 'تفعيل الحساب',
                      subtitle: 'في انتظار المراجعة',
                      status: _StageStatus.pending,
                      isLast: true,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // ─── Review duration info card ─────────────────────────────
              Container(
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
                      child: const Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'مدة المراجعة المتوقعة تستغرق عملية التحقق عادةً من 24 إلى 48 ساعة. قد يتم التواصل معك في حال الحاجة إلى أي مستندات إضافية.',
                        style: TextStyle(
                          color: Color(0xff3E4947),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // ─── Notification note ─────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: Color(0xff3E4947),
                    size: 18.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'سيتم إرسال إشعار فور الانتهاء من المراجعة.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff3E4947),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 300.h),

              // ─── Bottom button ─────────────────────────────────────────
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to home
                },
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: primaryTeal, width: 1.5),
                  ),
                  child: Center(
                    child: Text(
                      'العودة للرئيسية',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: primaryTeal,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Stage status enum ─────────────────────────────────────────────────────────

enum _StageStatus { done, inProgress, pending }

// ─── Single stage row ──────────────────────────────────────────────────────────

class _StageItem extends StatelessWidget {
  const _StageItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.isLast,
  });

  final String title;
  final String subtitle;
  final _StageStatus status;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _buildIcon(),
              if (!isLast)
                Expanded(
                  child: Container(width: 2.w, color: const Color(0xffE5E7EB)),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          // Text side (right in RTL)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: status == _StageStatus.pending
                          ? const Color(0xff9CA3AF)
                          : DataCheckPage.primaryTeal,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: status == _StageStatus.inProgress
                          ? const Color(0xFFF97316)
                          : const Color(0xff9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Icon + line column (left in RTL)
        ],
      ),
    );
  }

  Widget _buildIcon() {
    switch (status) {
      case _StageStatus.done:
        return Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: const Color(0xff00685F),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white, size: 18.sp),
        );
      case _StageStatus.inProgress:
        return Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF97316),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.access_time_rounded,
            color: Colors.white,
            size: 18.sp,
          ),
        );
      case _StageStatus.pending:
        return Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xffD1D5DB), width: 1.5),
          ),
          child: Icon(
            Icons.lock_outline,
            color: const Color(0xff9CA3AF),
            size: 18.sp,
          ),
        );
    }
  }
}
