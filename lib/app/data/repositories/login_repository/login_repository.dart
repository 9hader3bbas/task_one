import 'package:task_one/app/modules/login/models/login_response_model/login_response_model.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> login(String email, String password);
}
