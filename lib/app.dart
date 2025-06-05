import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one/app/modules/dashboard/dashboard_binding.dart';
import 'package:task_one/app/modules/dashboard/views/dashboard_view.dart';
import 'package:task_one/app/modules/get_started/views/get_started_view.dart';
import 'package:task_one/app/modules/login/login_binding.dart';
import 'package:task_one/core/constants/app_constants.dart';
import 'package:task_one/core/routes/app_pages.dart';
import 'package:task_one/core/theme/colors/app_colors.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.screenWidth, AppConstants.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return FutureBuilder<bool>(
          future: _checkAuth(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final isAuth = snapshot.data ?? false;

            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: AppColors.primary.withOpacity(0.3),
                  selectionHandleColor: AppColors.primary,
                ),
              ),
              title: "TaskOne",
              enableLog: true,
              defaultTransition: Transition.fadeIn,
              transitionDuration: const Duration(milliseconds: 250),
              initialBinding: isAuth ? DashboardBinding() : LoginBinding(),
              home: isAuth ? const DashboardView() : const GetStartedView(),
              getPages: appPages,
            );
          },
        );
      },
    );
  }

  Future<bool> _checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }
}
