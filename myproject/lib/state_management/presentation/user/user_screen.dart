import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/local_repository_impl.dart';
import 'package:myproject/state_management/presentation/routes/app_routes.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        LocalRepositoryImpl().clearAllData();
                        Get.offNamed(AppRoutes.login);
                      },
                      child: const Text('Log out'))
                ],
              ))
        ],
      ),
    );
  }
}