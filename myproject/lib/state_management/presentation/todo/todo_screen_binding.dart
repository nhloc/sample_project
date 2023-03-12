import 'package:get/get.dart';
import 'package:myproject/state_management/domain/usecases/todo_usecase.dart';
import 'package:myproject/state_management/presentation/todo/todo_controller.dart';

class TodosBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TodoGetDataUseCase>(() => TodoGetDataUseCase(Get.find()));
    Get.lazyPut<TodoAddUseCase>(() => TodoAddUseCase(Get.find()));
    Get.lazyPut<TodoDeleteUseCase>(() => TodoDeleteUseCase(Get.find()));
    Get.lazyPut<ToDoController>(() => ToDoController(Get.find(),Get.find(),Get.find()));
  }
}