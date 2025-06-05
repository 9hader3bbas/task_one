import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_one/app/modules/login/models/login_response_model/login_response_model.dart';

class LoginRemoteDataSource {
  final _url = Uri.parse('https://crm.wlslabs.com/api/v1/login');

  Future<LoginResponseModel> login(String email, String password) async {
    final response = await http.post(
      _url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['success'] == true) {
      return LoginResponseModel.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }
  }
}
