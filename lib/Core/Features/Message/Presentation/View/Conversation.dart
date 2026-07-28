import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Util/app_colors.dart';

class ChatMessageModel {
  final String id;
  final String text;
  final String time;
  final bool isMe;
  final bool isRead;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
    this.isRead = true,
  });
}

class ConversationPage extends StatefulWidget {
  final String name;
  final String imageUrl;
  final bool isOnline;

  const ConversationPage({
    super.key,
    this.name = 'أحمد العتيبي',
    this.imageUrl =
        'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=200&auto=format&fit=crop',
    this.isOnline = true,
  });

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<ChatMessageModel> messages = [
    ChatMessageModel(
      id: '1',
      text: 'أهلاً بك، سأصل إليك خلال 10 دقائق إن شاء الله.',
      time: '02:30 م',
      isMe: false,
    ),
    ChatMessageModel(
      id: '2',
      text: 'تمام، أنا بانتظارك. هل أحتاج لتجهيز أي شيء؟',
      time: '02:32 م',
      isMe: true,
      isRead: true,
    ),
    ChatMessageModel(
      id: '3',
      text:
          'يرجى فقط تجهيز ملف الفحوصات الأخيرة إن وجد. سأقوم بقياس الضغط والنبض فور وصولى.',
      time: '02:33 م',
      isMe: false,
    ),
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(
        ChatMessageModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          time: _formatCurrentTime(),
          isMe: true,
          isRead: false,
        ),
      );
    });
    _messageController.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _formatCurrentTime() {
    final now = TimeOfDay.now();
    final hour = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.period == DayPeriod.am ? 'ص' : 'م';
    return '$hour:$minute $period';
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              // Chat Messages Area
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: [
                      // Date Badge (اليوم)
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F4F4),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Text(
                            'اليوم',
                            style: TextStyle(
                              color: AppColors.hintGrey,
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Messages List
                      ...messages.map((msg) => _buildMessageBubble(msg)),
                    ],
                  ),
                ),
              ),

              // Bottom Input Bar
              _buildBottomInputBar(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: AppColors.primary, size: 24.sp),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22.r),
                child: Image.network(
                  widget.imageUrl,
                  width: 44.w,
                  height: 44.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 44.w,
                    height: 44.w,
                    color: const Color(0xFFEAF4F2),
                    child: Icon(
                      Icons.person,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
              if (widget.isOnline)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  widget.isOnline ? 'متصل الآن' : 'غير متصل',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.videocam_outlined,
            color: AppColors.primary,
            size: 24.sp,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.phone_outlined,
            color: AppColors.primary,
            size: 22.sp,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: AppColors.primary, size: 22.sp),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(ChatMessageModel msg) {
    final isMe = msg.isMe;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 280.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.primary : const Color(0xFFF2F5F5),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    msg.text,
                    style: TextStyle(
                      color: isMe ? Colors.white : AppColors.black,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: isMe
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Text(
                  msg.time,
                  style: TextStyle(
                    color: AppColors.hintGrey,
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (isMe) ...[
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.done_all,
                    color: msg.isRead ? AppColors.primary : AppColors.hintGrey,
                    size: 15.sp,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInputBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 14.h),
      color: Colors.white,
      child: Row(
        children: [
          // Send Button
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Transform.rotate(
                  angle: -0.6,
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),

          // Input Text Field Box
          Expanded(
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F6),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: TextStyle(color: AppColors.black, fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: 'اكتب رسالتك...',
                        hintStyle: TextStyle(
                          color: const Color(0xFFA0AAAA),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  Icon(
                    Icons.mic_none_rounded,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
