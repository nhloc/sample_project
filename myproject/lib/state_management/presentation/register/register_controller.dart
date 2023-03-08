import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/models/user.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';

class RegisterController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  RegisterController(this.apiRepositoryInterface);

  final fullnameTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final cpasswordTextController = TextEditingController();

  Future<String> registerUser() async {
    final fullname = fullnameTextController.text;
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    final confirmpassword = cpasswordTextController.text;
    // Check username, password
    if (username != '' && password != '') {
      // Check confirm password
      if (password != confirmpassword) return '3';
      // Check exists account
      bool check = await apiRepositoryInterface.checkRegisterUser(
          RegisterUser(fullname, username, password, confirmpassword));
      if (check) {
        return '2';
      }
      //Register
      apiRepositoryInterface.registerUser(
          RegisterUser(fullname, username, password, confirmpassword));
      return '0';
    }
    return '1';
  }
}
