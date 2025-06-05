import 'package:get/get.dart';
import 'package:task_one/app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardControllerImpl(),
    );
  }
}
