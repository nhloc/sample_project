import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/models/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

class ToDoController extends GetxController {
  TodoRepositoryInterface itemRepositoryInterface;
  ToDoController(this.itemRepositoryInterface);

  TextEditingController nameWorkController = TextEditingController();
  TextEditingController descWorkController = TextEditingController();
  var data = RxList<Todo>([]).obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final listData = await itemRepositoryInterface.getTodo();
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
    final listData = await itemRepositoryInterface
        .addTodo(Todo(data.value.length + 1, name, describe));
    nameWorkController.clear();
    descWorkController.clear();
    data.value.clear();
    data.value.addAll(listData);
    return true;
  }
}
