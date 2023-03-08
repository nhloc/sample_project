import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(Get.find()));
  }
}
