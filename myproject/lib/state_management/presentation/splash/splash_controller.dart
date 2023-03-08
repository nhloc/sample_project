import 'package:get/get.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';
import 'package:myproject/state_management/domain/repositories/local_storage_repository.dart';
import 'package:myproject/state_management/presentation/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  SplashController(this.localRepositoryInterface, this.apiRepositoryInterface);

  @override
  void onReady() {
    getSession();
    super.onReady();
  }

  void getSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != "") {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(AppRoutes.home);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
