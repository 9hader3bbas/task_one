import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_one/core/theme/assets/app_assets.dart';
import 'package:task_one/core/theme/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final String? suffixIcon;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool? isObscure;
  final bool? isPassword;
  final void Function()? onPressedSuffix;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.textEditingController,
    required this.focusNode,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.isObscure,
    this.isPassword,
    this.onPressedSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 16.0.sp,
          color: Colors.black),
      cursorColor: AppColors.primary,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(right: 10.0.w, top: 16.0.h, bottom: 16.0.h),
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              fontSize: 14.0.sp,
              color: Colors.black),
          prefixIconConstraints:
              BoxConstraints(minHeight: 18.0.h, minWidth: 18.0.w),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: SizedBox(
                height: 18.0.h,
                width: 18.0.w,
                child: SvgPicture.asset(
                  prefixIcon,
                  height: 18.0.h,
                  width: 18.0.w,
                  fit: BoxFit.contain,
                )),
          ),
          suffixIcon: isPassword ?? false
              ? IconButton(
                  onPressed: onPressedSuffix,
                  icon: SvgPicture.asset(
                    AppAssets.eyeCrossedIcon,
                    colorFilter: ColorFilter.mode(
                        isObscure ?? false
                            ? AppColors.typography.withOpacity(0.5)
                            : AppColors.primary,
                        BlendMode.srcIn),
                  ),
                  padding: EdgeInsets.zero,
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0.r),
              borderSide: BorderSide(color: AppColors.primary, width: 1.0.w)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0.r),
              borderSide: BorderSide(color: AppColors.primary, width: 1.0.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0.r),
              borderSide: BorderSide(color: AppColors.primary, width: 1.0.w))),
    );
  }
}
