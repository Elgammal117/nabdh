import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabdh/Core/Features/ClientHome/Presentation/View/ConfirmedBooking.dart';
import 'package:nabdh/Core/Features/ClientHome/Presentation/View/NurseProfile.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';
import 'package:nabdh/Core/helper/show_snack_bar.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class OfferModel {
  final String id;
  final String name;
  final double rating;
  final int price;
  final String imageUrl;
  final String experience;
  final String bio;

  OfferModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.experience,
    required this.bio,
  });
}

class _OffersPageState extends State<OffersPage> {
  List<OfferModel> offers = [
    OfferModel(
      id: '1',
      name: 'أحمد العتيبي',
      rating: 4.9,
      price: 250,
      imageUrl:
          'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&auto=format&fit=crop',
      experience: '5 سنوات خبرة',
      bio: 'أخصائي تمريض منزلي ورعاية الحالات الحرجة وكبار السن.',
    ),
    OfferModel(
      id: '2',
      name: 'سارة محمد',
      rating: 4.8,
      price: 200,
      imageUrl:
          'https://images.unsplash.com/photo-1594824813566-78a9c405a306?q=80&w=400&auto=format&fit=crop',
      experience: '4 سنوات خبرة',
      bio: 'تمريض عام ومتابعة المحاليل وإعطاء الحقن والغيارات.',
    ),
    OfferModel(
      id: '3',
      name: 'محمود علي',
      rating: 4.7,
      price: 300,
      imageUrl:
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?q=80&w=400&auto=format&fit=crop',
      experience: '6 سنوات خبرة',
      bio: 'أخصائي تمريض جراحي ورعاية ما بعد العمليات الجراحية.',
    ),
  ];

  void _handleAccept(OfferModel offer) {
    goTo(
      context,
      page: ConfirmedBookingPage(
        nurseName: offer.name,
        rating: offer.rating,
        imageUrl: offer.imageUrl,
      ),
    );
  }

  void _handleReject(OfferModel offer) {
    setState(() {
      offers.removeWhere((item) => item.id == offer.id);
    });
    showCustomSnackBar(
      context,
      text: 'تم رفض عرض ${offer.name}',
      status: SnackBarStatus.info,
    );
  }

  void _showNurseProfile(OfferModel offer) {
    goTo(
      context,
      page: NurseProfilePage(
        name: offer.name,
        rating: offer.rating,
        price: offer.price,
        imageUrl: offer.imageUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'العروض المتاحة',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'اختر الممرض الأنسب لطلبك',
                          style: TextStyle(
                            color: AppColors.hintGrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                        size: 26.sp,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    children: [
                      // Order Details Top Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffEAF4F2),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 44.w,
                                  height: 44.w,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/تمريض منزلي.svg',
                                      width: 22.w,
                                      height: 22.w,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'تمريض منزلي',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: AppColors.hintGrey,
                                          size: 14.sp,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          'مدينة نصر، القاهرة',
                                          style: TextStyle(
                                            color: AppColors.hintGrey,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'وقت الطلب',
                                  style: TextStyle(
                                    color: AppColors.hintGrey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  'منذ 5 دقائق',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Offers List
                      if (offers.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 60.h),
                          child: Column(
                            children: [
                              Icon(
                                Icons.inbox_outlined,
                                size: 60.sp,
                                color: AppColors.hintGrey.withOpacity(0.5),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'لا توجد عروض متاحة حالياً',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.hintGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        ...offers.map((offer) => _buildOfferCard(offer)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfferCard(OfferModel offer) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.borderGrey.withOpacity(0.7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header info: Avatar, Name, Rating & Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.r),
                        child: Image.network(
                          offer.imageUrl,
                          width: 56.w,
                          height: 56.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 56.w,
                                height: 56.w,
                                color: AppColors.primary.withOpacity(0.1),
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.primary,
                                  size: 30.sp,
                                ),
                              ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.name,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: const Color(0xFFFFB800),
                            size: 18.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '${offer.rating}',
                            style: TextStyle(
                              color: const Color(0xFFFFB800),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${offer.price}',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'ج.م',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Action Buttons: Reject & Accept
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _handleAccept(offer),
                  child: Container(
                    height: 75.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, color: Colors.white, size: 20.sp),
                        SizedBox(width: 6.w),
                        Text(
                          'موافق',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: GestureDetector(
                  onTap: () => _handleReject(offer),
                  child: Container(
                    height: 75.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE5E5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.close,
                          color: const Color(0xFFE53935),
                          size: 20.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'رفض',
                          style: TextStyle(
                            color: const Color(0xFFE53935),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // View Profile Button
          GestureDetector(
            onTap: () => _showNurseProfile(offer),
            child: Container(
              width: double.infinity,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.borderGrey, width: 1.2),
              ),
              child: Center(
                child: Text(
                  'عرض الملف الشخصي',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
