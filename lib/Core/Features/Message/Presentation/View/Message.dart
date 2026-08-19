import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/Message/Presentation/View/Conversation.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';

class MessageModel {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final int unreadCount;
  final bool isLastMessageHighlighted;

  MessageModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    this.unreadCount = 0,
    this.isLastMessageHighlighted = false,
  });
}

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _searchController = TextEditingController();

  List<MessageModel> conversations = [
    MessageModel(
      id: '1',
      name: 'أحمد العتيبي',
      lastMessage: 'سأصل خلال 15 دقيقة',
      time: '10:45 AM',
      imageUrl:
          'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=200&auto=format&fit=crop',
    ),
    MessageModel(
      id: '2',
      name: 'محمود علي',
      lastMessage: 'تم إكمال الإجراء بنجاح',
      time: '9:20 AM',
      imageUrl:
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?q=80&w=200&auto=format&fit=crop',
    ),
    MessageModel(
      id: '3',
      name: 'سارة حسن',
      lastMessage: 'كيف يمكننى مساعدتك اليوم',
      time: 'أمس',
      imageUrl:
          'https://images.unsplash.com/photo-1594824813566-78a9c405a306?q=80&w=200&auto=format&fit=crop',
      unreadCount: 2,
      isLastMessageHighlighted: true,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              // Top Bar Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.primary,
                        size: 24.sp,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'NABDH',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Content Area
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      // Title & Subtitle
                      Text(
                        'الرسائل',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'تواصل مع الممرضين بشأن حجوزاتك.',
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Search Input Field
                      _buildSearchField(),
                      SizedBox(height: 20.h),

                      // Conversations List
                      ...conversations.map(
                        (item) => _buildConversationItem(item),
                      ),

                      SizedBox(height: 20.h),

                      // View Archive Button
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(
                              color: const Color(0xFFD6E0E0),
                              width: 1.2,
                            ),
                          ),
                          child: Text(
                            'مشاهدة الأرشيف',
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
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

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F7),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(color: AppColors.black, fontSize: 14.5.sp),
        decoration: InputDecoration(
          hintText: 'ابحث فى المحادثات',
          hintStyle: TextStyle(
            color: const Color(0xFFA0AAAA),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: Icon(
            Icons.search_rounded,
            color: const Color(0xFF90A0A0),
            size: 22.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }

  Widget _buildConversationItem(MessageModel item) {
    return GestureDetector(
      onTap: () {
        goTo(
          context,
          page: ConversationPage(name: item.name, imageUrl: item.imageUrl),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFE0E5E5)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x06000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.network(
                item.imageUrl,
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 50.w,
                  height: 50.w,
                  color: const Color(0xFFEAF4F2),
                  child: Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 26.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Name and Last Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: item.isLastMessageHighlighted
                          ? AppColors.primary
                          : AppColors.hintGrey,
                      fontSize: 13.5.sp,
                      fontWeight: item.isLastMessageHighlighted
                          ? FontWeight.w700
                          : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Time and Unread Badge Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.time,
                  style: TextStyle(
                    color: AppColors.hintGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (item.unreadCount > 0) ...[
                  SizedBox(height: 6.h),
                  Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${item.unreadCount}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
