import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginCubit.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginState.dart';
import 'package:nabdh/Core/Features/request_service/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Core/helper/my_navigator.dart';
import 'package:nabdh/Core/helper/show_snack_bar.dart';
import 'package:nabdh/Navigation.dart';
import 'package:nabdh/dio_helper.dart';

class Signup extends StatelessWidget {
  const Signup({super.key, required this.accessToken});

  final String accessToken;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(accessToken: accessToken),
      child: _SignupView(accessToken: accessToken),
    );
  }
}

class _SignupView extends StatelessWidget {
  const _SignupView({required this.accessToken});

  final String accessToken;

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.get(context);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          goTo(
            context,
            page: MainScreen(accessToken: accessToken),
            state: NavAction.pushRemove,
          );
        } else if (state is SignupError) {
          showCustomSnackBar(
            context,
            text: state.message,
            status: SnackBarStatus.fail,
          );
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NABDH',
                        style: TextStyle(
                          color: AppColors.primary,
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
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Title ──
                      Text(
                        'إنشاء حساب جديد',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'ابدأ رحلتك معنا للوصول إلى خدمات تمريضية منزلية موثوقة وآمنة.',
                        style: TextStyle(
                          color: AppColors.hintGrey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 28.h),

                      // ── Profile Photo Picker ──
                      _PhotoPickerWidget(cubit: cubit, state: state),
                      SizedBox(height: 28.h),

                      // ── First Name ──
                      _FieldLabel('الاسم الأول'),
                      SizedBox(height: 8.h),
                      _InputField(
                        controller: cubit.firstNameController,
                        hint: 'أدخل اسمك الأول',
                        icon: Icons.person,
                      ),
                      SizedBox(height: 18.h),

                      // ── Last Name ──
                      _FieldLabel('الاسم الأخير'),
                      SizedBox(height: 8.h),
                      _InputField(
                        controller: cubit.lastNameController,
                        hint: 'أدخل اسمك الأخير',
                        icon: Icons.person_outline,
                      ),
                      SizedBox(height: 24.h),

                      // ── Gender ──
                      _FieldLabel('الجنس'),
                      SizedBox(height: 12.h),
                      _GenderSelector(cubit: cubit, state: state),
                      SizedBox(height: 24.h),

                      // ── Date of Birth ──
                      _FieldLabel('تاريخ الميلاد'),
                      SizedBox(height: 8.h),
                      _DatePickerField(cubit: cubit),
                      SizedBox(height: 40.h),

                      // ── Continue Button ──
                      _ContinueButton(cubit: cubit, state: state),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// Profile Photo Picker Widget
// ─────────────────────────────────────────────
class _PhotoPickerWidget extends StatelessWidget {
  const _PhotoPickerWidget({required this.cubit, required this.state});

  final SignupCubit cubit;
  final SignupState state;

  void _showPickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.h),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.borderGrey,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'اختر صورة',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12.h),
              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.primary),
                title: Text('الكاميرا', style: TextStyle(fontSize: 15.sp)),
                onTap: () {
                  Navigator.pop(context);
                  cubit.pickPhoto(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.primary),
                title: Text('المعرض', style: TextStyle(fontSize: 15.sp)),
                onTap: () {
                  Navigator.pop(context);
                  cubit.pickPhoto(ImageSource.gallery);
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasPhoto = state is SignupPhotoChanged && cubit.profilePhoto != null;

    return Center(
      child: GestureDetector(
        onTap: () => _showPickerSheet(context),
        child: Stack(
          children: [
            // Avatar circle
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: AppColors.primary, width: 2),
                image: hasPhoto
                    ? DecorationImage(
                        image: FileImage(cubit.profilePhoto!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: hasPhoto
                  ? null
                  : Icon(
                      Icons.person,
                      size: 50.sp,
                      color: Colors.grey.withOpacity(0.5),
                    ),
            ),
            // Camera badge
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Icon(Icons.camera_alt, size: 16.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Gender Selector Widget
// ─────────────────────────────────────────────
class _GenderSelector extends StatelessWidget {
  const _GenderSelector({required this.cubit, required this.state});

  final SignupCubit cubit;
  final SignupState state;

  @override
  Widget build(BuildContext context) {
    final gender = cubit.selectedGender;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey[200],
      ),
      height: 50.h,
      width: double.infinity,
      padding: EdgeInsets.all(4.r),
      child: Row(
        children: [
          _GenderButton(
            label: 'ذكر',
            value: 'MALE',
            selected: gender == 'MALE',
            onTap: () => cubit.setGender('MALE'),
          ),
          SizedBox(width: 8.w),
          _GenderButton(
            label: 'أنثى',
            value: 'FEMALE',
            selected: gender == 'FEMALE',
            onTap: () => cubit.setGender('FEMALE'),
          ),
        ],
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 40.h,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : AppColors.hintGrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Continue Button
// ─────────────────────────────────────────────
class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.cubit, required this.state});

  final SignupCubit cubit;
  final SignupState state;

  @override
  Widget build(BuildContext context) {
    final isLoading = state is SignupLoading;

    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => cubit.SignUpLogic(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 22.w,
                height: 22.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
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
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
                ],
              ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Shared helpers
// ─────────────────────────────────────────────
class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      color: AppColors.primary,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.hintGrey, fontSize: 14.sp),
        prefixIcon: Icon(icon, color: AppColors.hintGrey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: const Color(0xffBEC9C6).withOpacity(0.6),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Date Picker Field Widget
// ─────────────────────────────────────────────
class _DatePickerField extends StatefulWidget {
  const _DatePickerField({required this.cubit});
  final SignupCubit cubit;

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.cubit.selectedDate ?? DateTime(now.year - 20),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'اختر تاريخ الميلاد',
      cancelText: 'إلغاء',
      confirmText: 'تأكيد',
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            onSurface: Colors.black87,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      widget.cubit.setDateOfBirth(picked);
      setState(() {});
    }
  }

  String _format(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} / ${d.month.toString().padLeft(2, '0')} / ${d.year}';

  @override
  Widget build(BuildContext context) {
    final date = widget.cubit.selectedDate;
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        height: 54.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: date != null
                ? AppColors.primary
                : const Color(0xffBEC9C6).withOpacity(0.6),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: date != null ? AppColors.primary : AppColors.hintGrey,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                date != null ? _format(date) : 'اختر تاريخ الميلاد',
                style: TextStyle(
                  color: date != null ? Colors.black87 : AppColors.hintGrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.hintGrey, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
