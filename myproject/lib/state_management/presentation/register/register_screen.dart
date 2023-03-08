import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/api_repository_impl.dart';
import 'package:myproject/state_management/presentation/register/register_controller.dart';
import 'package:myproject/state_management/presentation/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController registerController =
      RegisterController(Get.put(Get.put(ApiRepositoryImpl())));
  RegisterScreen({super.key});
  void registerUser() async {
    final result = await registerController.registerUser();
    if (result == '0') {
      Get.snackbar('Register', 'Account successfully created!');
      Get.offNamed(AppRoutes.login);
    } else if (result == '1') {
      Get.snackbar('Error', 'Username and Password must be fill in!');
    } else if (result == '2') {
      Get.snackbar('Error', 'Account already exists!');
    } else if (result == '3') {
      Get.snackbar('Error', 'Password and confirm password are not the same!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Create Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            // Full name
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                        controller: registerController.fullnameTextController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Full Name')),
                  ),
                )),
            // Username
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: registerController.usernameTextController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Username'),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            // Password
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      obscureText: true,
                      controller: registerController.passwordTextController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            //Cofirm Password
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      obscureText: true,
                      controller: registerController.cpasswordTextController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password'),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          registerUser();
                        },
                        child: const Text('Register'))
                  ],
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                    onPressed: () => Get.offNamed(AppRoutes.login),
                    child: const Text('Login now',
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
