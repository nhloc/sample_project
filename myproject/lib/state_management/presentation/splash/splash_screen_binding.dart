import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
        () => SplashController(Get.find(), Get.find()));
  }
}
