import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
