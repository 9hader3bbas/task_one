import 'package:task_one/app/modules/login/models/user_model/user_model.dart';

class LoginResponseModel {
  final bool success;
  final String message;
  final UserModel user;
  final String token;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      token: json['data']['token'],
      user: UserModel.fromJson(json['data']['user']),
    );
  }
}
