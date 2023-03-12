import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/entities/todo.dart';
import 'package:myproject/state_management/domain/usecases/todo_usecase.dart';

class ToDoController extends GetxController {
  TodoGetDataUseCase todoGetDataUseCase;
  TodoAddUseCase todoAddUseCase;
  TodoDeleteUseCase todoDeleteUseCase;
  ToDoController(
      this.todoGetDataUseCase, this.todoAddUseCase, this.todoDeleteUseCase);

  TextEditingController nameWorkController = TextEditingController();
  TextEditingController descWorkController = TextEditingController();
  var data = RxList<Todo>([]).obs;
  
  @override
  void onReady() {
    getData();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final listData = await todoGetDataUseCase.call();
    if (listData.isNotEmpty) {
      data.value.clear();
      data.value.addAll(listData);
    }
  }

  Future<bool> addTodo() async {
    final name = nameWorkController.text;
    final describe = descWorkController.text;
    if (name == '') {
      return false;
    }
    final listData = await todoAddUseCase.call(Todo(null, name, describe));
    nameWorkController.clear();
    descWorkController.clear();
    data.value.clear();
    data.value.addAll(listData);
    return true;
  }

  Future<void> deleteTodo(int index) async {
    final int idDelete = data.value[index].id!;
    final listData = await todoDeleteUseCase.call(idDelete);
    data.value.clear();
    data.value.addAll(listData);
  }
}
