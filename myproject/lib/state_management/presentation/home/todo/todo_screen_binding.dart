import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/home/todo/todo_controller.dart';

class TodosBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ToDosController>(() => ToDosController(Get.find()));
  }
}