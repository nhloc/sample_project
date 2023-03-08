import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find(), Get.find()));
  }
}
