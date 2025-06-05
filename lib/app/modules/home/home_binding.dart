import 'package:get/get.dart';
import 'package:task_one/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeControllerImpl(),
    );
  }
}
