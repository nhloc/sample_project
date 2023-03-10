import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/todo_repository_impl.dart';
import 'package:myproject/state_management/presentation/todo/detail_screen.dart';
import 'package:myproject/state_management/presentation/todo/todo_controller.dart';

class TodoScreen extends GetWidget<ToDoController> {
  TodoScreen({super.key});
  final ToDoController toDoController =
      ToDoController(Get.put(Get.put(TodoRepositoryImpl())));

  void getData() {
    toDoController.getData();
  }

  void addData() async {
    final result = await toDoController.addTodo();
    if (!result) {
      Get.snackbar('Error', 'Name must be fill in!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 40),
        // Name Todo
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: toDoController.nameWorkController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Name'),
                  ),
                ))),
        const SizedBox(height: 10),
        // Describe
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                    controller: toDoController.descWorkController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Describe')),
              ),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      toDoController.getData();
                    },
                    child: const Text('Get Data')),
                const Padding(padding: EdgeInsets.only(right: 10)),
                ElevatedButton(
                    onPressed: () {
                      addData();
                    },
                    child: const Text('Add Data'))
              ],
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text('List ToDo',
                  style: TextStyle(fontSize: 16, color: Colors.blue))
            ])),
        Expanded(
            child: Obx(
          () => ListView.builder(
            itemCount: toDoController.data.value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(toDoController.data.value[index].name),
                subtitle: Text(toDoController.data.value[index].describe),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(),
                      settings: RouteSettings(
                        arguments: toDoController.data.value[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ))
      ]),
    );
  }
}
