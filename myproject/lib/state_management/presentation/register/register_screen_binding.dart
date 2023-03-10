import 'package:get/get.dart';
import 'package:myproject/state_management/domain/usecases/register_usecase.dart';
import 'package:myproject/state_management/presentation/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUseCase>(() => RegisterUseCase(Get.find()));
    Get.lazyPut<CheckExistUseCase>(() => CheckExistUseCase(Get.find()));
    Get.lazyPut<RegisterController>(() => RegisterController(Get.find(),Get.find()));
  }
}
