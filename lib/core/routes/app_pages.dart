import 'package:get/get.dart';
import 'package:task_one/app/modules/dashboard/dashboard_binding.dart';
import 'package:task_one/app/modules/dashboard/views/dashboard_view.dart';
import 'package:task_one/app/modules/get_started/views/get_started_view.dart';
import 'package:task_one/app/modules/home/home_binding.dart';
import 'package:task_one/app/modules/home/views/home_view.dart';
import 'package:task_one/app/modules/login/login_binding.dart';
import 'package:task_one/app/modules/login/views/login_view.dart';
import 'package:task_one/app/modules/login_or_signup/views/login_or_signup_view.dart';
import 'package:task_one/core/routes/app_routes.dart';

List<GetPage<dynamic>>? appPages = [
  GetPage(
    name: AppRoutes.getStarted,
    page: () {
      return GetStartedView();
    },
  ),
  GetPage(
    name: AppRoutes.loginOrSignup,
    page: () {
      return LoginOrSignupView();
    },
  ),
  GetPage(
      name: AppRoutes.login,
      page: () {
        return LoginView();
      },
      binding: LoginBinding()),
  GetPage(
      name: AppRoutes.dashboard,
      page: () {
        return DashboardView();
      },
      binding: DashboardBinding()),
  GetPage(
      name: AppRoutes.home,
      page: () {
        return HomeView();
      },
      binding: HomeBinding()),
];
