import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_one/core/global/widgets/Background_wrapper/Background_wrapper.dart';
import 'package:task_one/core/global/widgets/gradient_button/gradient_button.dart';
import 'package:task_one/core/routes/app_routes.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 343.0.h,
          width: double.infinity,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48.0.r),
              topRight: Radius.circular(48.0.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 73.0.h, bottom: 39.0.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF656565), Color(0xFF0EB29A)],
                      ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                      child: Text(
                        'Pick&',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 32.0.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Buy',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 32.0.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF0EB29A), // ثابت
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 39.0.h),
                child: Text(
                  'Pick what you love, buy instantly',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 41.0.w),
                  child: GradientButton(
                      text: "Let's Get Started",
                      onPressed: () => Get.toNamed(AppRoutes.loginOrSignup))),
            ],
          ),
        ),
      ),
    );
  }
}
