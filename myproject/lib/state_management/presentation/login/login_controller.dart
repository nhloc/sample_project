import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/local_repository_impl.dart';
import 'package:myproject/state_management/domain/exceptions/auth_exception.dart';
import 'package:myproject/state_management/domain/models/user.dart';
import 'package:myproject/state_management/domain/repositories/local_storage_repository.dart';
import 'package:myproject/state_management/domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LocalRepositoryInterface localstorage = Get.put(LocalRepositoryImpl());
  final LoginUseCase loginUseCase;
  LoginController(this.loginUseCase);

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      final loginReponse =
          await loginUseCase.call(LoginRequest(username, password));
      await localstorage.saveToken(loginReponse.token);
      await localstorage.saveUser(loginReponse.user);
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
