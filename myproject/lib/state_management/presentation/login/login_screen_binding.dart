import 'package:get/get.dart';
import 'package:myproject/state_management/domain/usecases/login_usecase.dart';
import 'package:myproject/state_management/presentation/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
  }
}
