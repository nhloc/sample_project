import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/api_repository_impl.dart';
import 'package:myproject/state_management/data/datasources/local_repository_impl.dart';
import 'package:myproject/state_management/presentation/login/login_controller.dart';
import 'package:myproject/state_management/presentation/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  final LoginController homeController = LoginController(
      Get.put(Get.put(LocalRepositoryImpl())),
      Get.put(Get.put(ApiRepositoryImpl())));
  LoginScreen({super.key});
  void login() async {
    final result = await homeController.login();
    if (result) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar('Error', 'Username or Password is not correct!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Login',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Please sign in to continue.',
                        style: TextStyle(fontSize: 16))
                  ],
                )),
            const SizedBox(height: 40),
            // Username
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: homeController.usernameTextController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Username'),
                      ),
                    ))),
            const SizedBox(height: 10),
            // Password
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                        obscureText: true,
                        controller: homeController.passwordTextController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password')),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () => login(), child: const Text('Login'))
                  ],
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account?'),
                TextButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.register),
                    child: const Text('Register now',
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
