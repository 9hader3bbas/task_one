import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_one/core/global/widgets/gradient_background/gradient_background.dart';
import 'package:task_one/core/routes/app_routes.dart';
import 'package:task_one/core/theme/assets/app_assets.dart';

class LoginOrSignupView extends StatelessWidget {
  const LoginOrSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 34.0.w, top: 33.0.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () => Get.offNamed(AppRoutes.getStarted),
                  icon: SvgPicture.asset(AppAssets.backArrowLineIcon)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 42.0.w, right: 35.0.w),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.illustrationimg1,
                  height: 280.0.h,
                  width: 300.0.w,
                ),
                SizedBox(
                  height: 96.0.h,
                ),
                Text(
                  "Sign in to continue or \ncreate an account to\nstart shopping.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800,
                      fontSize: 32.0.sp),
                ),
                SizedBox(
                  height: 39.0.h,
                ),
                Container(
                  height: 50.0.h,
                  width: 316.0.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(25.0.r)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        borderRadius: BorderRadius.circular(25.0.r),
                        child: Container(
                          height: 50.0.h,
                          width: 158.0.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFF0EB29A),
                              borderRadius: BorderRadius.circular(25.0.r)),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50.0.h,
                          width: 70.0.w,
                          child: Container(
                            height: 50.0.h,
                            width: 70.0.w,
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0.sp,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
