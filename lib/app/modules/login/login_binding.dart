import 'package:get/get.dart';
import 'package:task_one/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginControllerImpl(),
    );
  }
}
