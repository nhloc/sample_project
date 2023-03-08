import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/local_repository_impl.dart';
import 'package:myproject/state_management/presentation/routes/app_routes.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Image.network('https://storage.googleapis.com/cms-storage-bucket/124df7b47679f5f7d917.png')],)),
    );
  }
}
class UserPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Page')),
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