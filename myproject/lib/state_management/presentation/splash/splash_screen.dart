import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/splash/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Image.network('https://storage.googleapis.com/cms-storage-bucket/124df7b47679f5f7d917.png')]))
    );
  }
}
