import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/View/ConfirmedBooking.dart';
import 'package:nabdh/Core/Features/review/Presentation/View/Review.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class PaymentPage extends StatefulWidget {
  final String serviceTitle;
  final String providerName;
  final String date;
  final String time;
  final int price;

  const PaymentPage({
    super.key,
    this.serviceTitle = 'تمريض منزلي',
    this.providerName = 'أحمد العتيبي',
    this.date = '24 مايو 2024',
    this.time = '10:30 صباحاً',
    this.price = 250,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

enum PaymentMethod { electronic, cash }

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethod _selectedMethod = PaymentMethod.electronic;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              // Top Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'NABDH',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(width: 120.w),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      // Screen Title & Subtitle
                      Text(
                        'الدفع',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'راجع تفاصيل الخدمة وأكمل عملية الدفع.',
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 48.h),

                      // Service Details Card
                      _buildServiceDetailsCard(),
                      SizedBox(height: 24.h),

                      // Price Breakdown Card
                      _buildPriceCard(),
                      SizedBox(height: 24.h),

                      // Payment Method Section Title
                      Text(
                        'اختر وسيلة الدفع',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 14.h),

                      // Electronic Payment Card
                      _buildPaymentOption(
                        method: PaymentMethod.electronic,
                        title: 'الدفع الإلكتروني',
                        icon: Icons.account_balance_wallet_outlined,
                      ),
                      SizedBox(height: 12.h),

                      // Cash Payment Card
                      _buildPaymentOption(
                        method: PaymentMethod.cash,
                        title: 'الدفع نقداً',
                        icon: Icons.receipt_long_outlined,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),

              // Confirm Payment Button
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      goTo(context, page: ReviewPage());
                    },
                    child: Text(
                      'تأكيد الدفع',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
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

  Widget _buildServiceDetailsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE0E5E5)),
      ),
      child: Column(
        children: [
          // Service Type
          _buildInfoItem(
            label: 'نوع الخدمة',
            value: widget.serviceTitle,
            icon: Icons.add_box_outlined,
          ),
          SizedBox(height: 16.h),

          // Provider
          _buildInfoItem(
            label: 'المقدم',
            value: widget.providerName,
            icon: Icons.person_outline,
          ),
          SizedBox(height: 16.h),

          // Date & Time Row
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  label: 'التاريخ',
                  value: widget.date,
                  icon: Icons.calendar_today_outlined,
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  label: 'الوقت',
                  value: widget.time,
                  icon: Icons.access_time_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: const BoxDecoration(
            color: Color(0xFFEAF4F2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 20.sp),
        ),
        SizedBox(width: 8.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppColors.hintGrey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceCard() {
    return Container(
      height: 130.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE0E5E5)),
      ),
      child: Column(
        children: [
          // Service Cost
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تكلفة الخدمة',
                style: TextStyle(
                  color: AppColors.hintGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.price} ج.م',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: const Divider(color: Color(0xFFECECEC), height: 1),
          ),
          // Total Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المبلغ الإجمالي',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.price} ج.م',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required PaymentMethod method,
    required String title,
    required IconData icon,
  }) {
    final isSelected = _selectedMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE0E5E5),
            width: isSelected ? 1.8 : 1.0,
          ),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: Color(0x0F00685F),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            // Radio button icon
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFFB0BABA),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 14.w),

            // Option Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15.5.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),

            // Icon box on right
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.hintGrey,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
