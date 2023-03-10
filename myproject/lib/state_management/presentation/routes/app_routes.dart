import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/todo_repository_impl.dart';
import 'package:myproject/state_management/presentation/home/home_screen.dart';
import 'package:myproject/state_management/presentation/home/home_screen_binding.dart';
import 'package:myproject/state_management/presentation/todo/todo_screen.dart';
import 'package:myproject/state_management/presentation/todo/todo_screen_binding.dart';
import 'package:myproject/state_management/presentation/login/login_screen.dart';
import 'package:myproject/state_management/presentation/login/login_screen_binding.dart';
import 'package:myproject/state_management/presentation/register/register_screen.dart';
import 'package:myproject/state_management/presentation/register/register_screen_binding.dart';
import 'package:myproject/state_management/presentation/splash/splash_screen.dart';
import 'package:myproject/state_management/presentation/splash/splash_screen_binding.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String todo = '/todo';
}

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.register,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoutes.todo,
        page: () => TodoScreen(),
        binding: TodosBinding()),
  ];
}
