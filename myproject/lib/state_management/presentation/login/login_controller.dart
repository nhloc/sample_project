import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/exceptions/auth_exception.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';
import 'package:myproject/state_management/domain/repositories/local_storage_repository.dart';
import 'package:myproject/state_management/domain/request/login_request.dart';

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  LoginController(this.localRepositoryInterface, this.apiRepositoryInterface);

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      final loginReponse =
          await apiRepositoryInterface.login(LoginRequest(username, password));
      await localRepositoryInterface.saveToken(loginReponse.token);
      await localRepositoryInterface.saveUser(loginReponse.user);
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
