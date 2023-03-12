import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/entities/user.dart';
import 'package:myproject/state_management/domain/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;
  final CheckExistUseCase checkExistUseCase;
  RegisterController(this.registerUseCase, this.checkExistUseCase);

  final fullnameTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final cpasswordTextController = TextEditingController();

  Future<bool> checkExits(String username) async {
    return await checkExistUseCase.call(username);
  }

  Future<String> validateRegister() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    final confirmpassword = cpasswordTextController.text;
    // Check username, password
    if (username != '' && password != '') {
      // Check confirm password
      if (password != confirmpassword) return '3';
      // Check exists account
      if (await checkExits(username)) return '2';
      return '0';
    }
    return '1';
  }

  Future<void> registerUser() async {
    final fullname = fullnameTextController.text;
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    //Register
    await registerUseCase
        .call(User(null, fullname, username, password));
  }
}
