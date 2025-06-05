import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_one/app/modules/home/controllers/home_controller.dart';
import 'package:task_one/core/theme/colors/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: AppColors.neutralBackground,
      appBar: AppBar(
        // backgroundColor: AppColors.neutralBackground,
        surfaceTintColor: AppColors.primary.withOpacity(0.85),
        backgroundColor: AppColors.primary.withOpacity(0.85),
        title: Text(
          'Task One',
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 20.sp,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: Column()),
    );
  }
}
