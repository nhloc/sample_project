import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/main_binding.dart';
import 'package:myproject/state_management/presentation/routes/app_routes.dart';

class StateManagement extends StatelessWidget {
  StateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
