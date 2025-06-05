import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_one/app/modules/login/controllers/login_controller.dart';
import 'package:task_one/core/global/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:task_one/core/global/widgets/gradient_background/gradient_background.dart';
import 'package:task_one/core/global/widgets/gradient_button/gradient_button.dart';
import 'package:task_one/core/routes/app_routes.dart';
import 'package:task_one/core/theme/assets/app_assets.dart';
import 'package:task_one/core/theme/colors/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return GradientBackground(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 34.0.w, top: 33.0.h),
                child: IconButton(
                    onPressed: () => Get.offNamed(AppRoutes.loginOrSignup),
                    icon: SvgPicture.asset(AppAssets.backArrowLineIcon)),
              ),
            ),
            SizedBox(
              height: 25.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0.w),
              child: Text(
                "Welcome\nBack.",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    fontSize: 32.0.sp,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 69.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 41.0.w),
              child: CustomTextFormField(
                hintText: "Email",
                prefixIcon: AppAssets.emailIcon,
                textEditingController: controller.emailTEC,
                focusNode: controller.emailFN,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(controller.passwordFN),
              ),
            ),
            SizedBox(
              height: 39.0.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 41.0.w),
                child: Obx(
                  () => CustomTextFormField(
                    hintText: "Password",
                    prefixIcon: AppAssets.lockIcon,
                    textEditingController: controller.passwordTEC,
                    focusNode: controller.passwordFN,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).unfocus(),
                    isPassword: true,
                    isObscure: controller.isPasswordObscured.value,
                    onPressedSuffix: () => controller.toggleObscure(),
                  ),
                )),
            SizedBox(
              height: 13.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 40.0.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0.sp,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 39.0.h,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 41.0.w),
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : GradientButton(
                        text: "Login",
                        onPressed: () {
                          controller.login();
                        }),
              ),
            ),
            SizedBox(
              height: 39.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don`t have an account?",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0.sp,
                      color: const Color(0xFF656565)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0.sp,
                          color: AppColors.primary),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
