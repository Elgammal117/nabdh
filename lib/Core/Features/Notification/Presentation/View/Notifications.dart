import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Util/app_colors.dart';

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final bool isUnread;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    this.isUnread = false,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    IconData? icon,
    bool? isUnread,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      icon: icon ?? this.icon,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationModel> _notifications = [
    NotificationModel(
      id: '1',
      title: 'تم تأكيد الحجز',
      description:
          'تم تأكيد حجزك بنجاح. سنقوم بإبلاغك فور تعيين الممرض المخصص لك.',
      time: 'منذ ١٠ دقائق',
      icon: Icons.check_circle_outline,
      isUnread: true,
    ),
    NotificationModel(
      id: '2',
      title: 'الممرض في الطريق',
      description:
          'الممرض في طريقه إلى موقعك. يمكنك متابعة الموقع مباشرة عبر لوحة التحكم.',
      time: 'منذ ساعة',
      icon: Icons.local_shipping_outlined,
      isUnread: true,
    ),
    NotificationModel(
      id: '3',
      title: 'اكتملت الخدمة',
      description:
          'تم الانتهاء من تقديم الخدمة بنجاح. يرجى تقييم تجربتك لتحسين خدماتنا.',
      time: 'منذ ٣ ساعات',
      icon: Icons.check_circle_outline,
      isUnread: false,
    ),
    NotificationModel(
      id: '4',
      title: 'تمت إضافة حجز مجدول',
      description:
          'تم حفظ موعد الخدمة المجدولة في تقويمك. سنذكرك قبل الموعد بـ ٢٤ ساعة.',
      time: 'أمس',
      icon: Icons.calendar_today_outlined,
      isUnread: false,
    ),
  ];

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications
          .map((item) => item.copyWith(isUnread: false))
          .toList();
    });
  }

  void _clearAllNotifications() {
    setState(() {
      _notifications.clear();
    });
  }

  void _toggleReadStatus(String id) {
    setState(() {
      _notifications = _notifications.map((item) {
        if (item.id == id) {
          return item.copyWith(isUnread: false);
        }
        return item;
      }).toList();
    });
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
              // ────── Header App Bar ──────
              _buildHeader(context),

              // ────── Body List / Main Content ──────
              Expanded(
                child: _notifications.isEmpty
                    ? _buildEmptyState()
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            // Header Subtitle Text
                            Text(
                              'تابع آخر التحديثات المتعلقة بحجوزاتك وخدماتك.',
                              style: TextStyle(
                                color: AppColors.hintGrey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 40.h),

                            // List of Notifications
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _notifications.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 14.h),
                              itemBuilder: (context, index) {
                                final notification = _notifications[index];
                                return _buildNotificationCard(notification);
                              },
                            ),
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

  // ────── Custom Header Widget ──────
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60.h,

      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFF2F4F7), width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side (in RTL, 1st child is Right side)
          // In RTL layout:
          // Right = Three Dots Menu
          // Center = Title
          // Left = Back Arrow
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.primary, size: 24.sp),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            onSelected: (value) {
              if (value == 'read_all') {
                _markAllAsRead();
              } else if (value == 'clear_all') {
                _clearAllNotifications();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'read_all',
                child: Row(
                  children: [
                    Icon(Icons.done_all, color: AppColors.primary, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'تحديد الكل كقراءة',
                      style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'clear_all',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'مسح الكل',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Center: Title
          Text(
            'الإشعارات',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          // Left Side: Back Arrow Button
          IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.arrow_forward,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }

  // ────── Notification Item Card Widget ──────
  Widget _buildNotificationCard(NotificationModel item) {
    return InkWell(
      onTap: () => _toggleReadStatus(item.id),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFEBECEC), width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Right Side Icon Circle (RTL Start)
            Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: item.isUnread
                    ? AppColors.primary.withOpacity(0.12)
                    : const Color(0xFFF2F4F7),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.icon,
                color: item.isUnread
                    ? AppColors.primary
                    : const Color(0xFF667085),
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),

            // Content Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Time & Unread Dot Row
                  Row(
                    children: [
                      // Title Text
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      // Time Text
                      Text(
                        item.time,
                        style: TextStyle(
                          color: const Color(0xFF667085),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      // Unread Green Dot (Far Left in RTL)
                      if (item.isUnread) ...[
                        SizedBox(width: 8.w),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // Subtitle / Description Text
                  Text(
                    item.description,
                    style: TextStyle(
                      color: AppColors.hintGrey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ────── Empty State Widget ──────
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_off_outlined,
              size: 40.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'لا يوجد إشعارات حالياً',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'ستظهر لك جميع التحديثات فور وصولها.',
            style: TextStyle(color: AppColors.hintGrey, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
