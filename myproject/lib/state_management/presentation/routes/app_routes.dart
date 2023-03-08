import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/item_repository_impl.dart';
import 'package:myproject/state_management/presentation/home/home_screen.dart';
import 'package:myproject/state_management/presentation/home/home_screen_binding.dart';
import 'package:myproject/state_management/presentation/home/todo/todo_screen.dart';
import 'package:myproject/state_management/presentation/home/todo/todo_screen_binding.dart';
import 'package:myproject/state_management/presentation/login/login_screen.dart';
import 'package:myproject/state_management/presentation/login/login_screen_binding.dart';
import 'package:myproject/state_management/presentation/register/register_screen.dart';
import 'package:myproject/state_management/presentation/register/register_screen_binding.dart';
import 'package:myproject/state_management/presentation/splash/splash_screen.dart';
import 'package:myproject/state_management/presentation/splash/splash_screen_binding.dart';

class AppRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String register = '/register';
  static final String home = '/home';
  static final String todo = '/todo';
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
        page: () => TodosScreen(),
        binding: TodosBinding()),
  ];
}
