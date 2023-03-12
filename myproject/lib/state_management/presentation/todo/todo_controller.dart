import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/entities/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

class ToDoController extends GetxController {
  TodoRepositoryInterface repositoryInterface;
  ToDoController(this.repositoryInterface);

  TextEditingController nameWorkController = TextEditingController();
  TextEditingController descWorkController = TextEditingController();
  var data = RxList<Todo>([]).obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final listData = await repositoryInterface.getTodo();
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
    final listData = await repositoryInterface
        .addTodo(Todo(null, name, describe));
    nameWorkController.clear();
    descWorkController.clear();
    data.value.clear();
    data.value.addAll(listData);
    return true;
  }

  Future<void> deleteTodo(int index) async {
    final int idDelete = data.value[index].id!;
    final listData = await repositoryInterface.deleteTodo(idDelete);
    data.value.clear();
    data.value.addAll(listData);
  }
}
