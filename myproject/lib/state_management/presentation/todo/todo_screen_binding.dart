import 'package:get/get.dart';
import 'package:myproject/state_management/presentation/todo/todo_controller.dart';

class TodosBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ToDoController>(() => ToDoController(Get.find()));
  }
}