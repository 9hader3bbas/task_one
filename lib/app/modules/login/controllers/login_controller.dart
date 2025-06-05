import 'dart:convert';
import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one/app/modules/login/models/login_response_model/login_response_model.dart';
import 'package:task_one/core/routes/app_routes.dart';
import 'package:task_one/core/theme/colors/app_colors.dart';

abstract class LoginController extends GetxController {
  TextEditingController get emailTEC;

  TextEditingController get passwordTEC;

  FocusNode get emailFN;

  FocusNode get passwordFN;

  RxBool get isPasswordObscured;
  RxBool get isLoading;

  void toggleObscure();

  Future<void> login();
}

class LoginControllerImpl extends LoginController {
  @override
  TextEditingController emailTEC = TextEditingController();

  @override
  TextEditingController passwordTEC = TextEditingController();

  @override
  FocusNode emailFN = FocusNode();

  @override
  FocusNode passwordFN = FocusNode();

  @override
  final RxBool isPasswordObscured = true.obs;
  @override
  void toggleObscure() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  @override
  final RxBool isLoading = false.obs;

  @override
  Future<void> login() async {
    final email = emailTEC.text.trim();
    final password = passwordTEC.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password are required",
        titleText: Text(
          "Error",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 16.0.sp,
              color: AppColors.typography),
        ),
        messageText: Text(
          "Email and password are required",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14.0.sp,
              color: AppColors.typography),
        ),
      );
      return;
    }

    final url = Uri.parse('https://crm.wlslabs.com/api/v1/login');

    try {
      isLoading.value = true;

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        final loginResponse = LoginResponseModel.fromJson(data);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginResponse.token);
        await prefs.setString('user_email', loginResponse.user.email);
        await prefs.setString('user_name', loginResponse.user.name);
        await prefs.setInt('user_id', loginResponse.user.id);
        await prefs.setBool('is_auth', true);
        log(loginResponse.token);
        log(loginResponse.user.email);
        log(loginResponse.user.name);
        log(loginResponse.user.id.toString());

        Get.snackbar(
          "Success",
          "Welcome ${loginResponse.user.name}",
          titleText: Text(
            "Success",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 16.0.sp,
                color: AppColors.typography),
          ),
          messageText: Text(
            "Welcome ${loginResponse.user.name}",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 14.0.sp,
                color: AppColors.typography),
          ),
        );
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Get.snackbar(
          "Login Failed",
          data['message'] ?? "Unknown error",
          titleText: Text(
            "Login Failed",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 16.0.sp,
                color: AppColors.typography),
          ),
          messageText: Text(
            data['message'] ?? "Unknown error",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 14.0.sp,
                color: AppColors.typography),
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        titleText: Text(
          "Error",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 16.0.sp,
              color: AppColors.typography),
        ),
        messageText: Text(
          "Something went wrong",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14.0.sp,
              color: AppColors.typography),
        ),
      );
      print("Login error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
