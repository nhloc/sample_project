import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/usecases/todo_usecase.dart';
import 'package:myproject/state_management/presentation/todo/todo_controller.dart';

class TodoScreen extends GetWidget<ToDoController> {
  TodoScreen({super.key});
  final ToDoController toDoController =
      ToDoController(Get.put<TodoGetDataUseCase>(TodoGetDataUseCase(Get.find())),Get.put<TodoAddUseCase>(TodoAddUseCase(Get.find())), Get.put<TodoDeleteUseCase>(TodoDeleteUseCase(Get.find())));

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
      backgroundColor: const Color.fromARGB(255, 87, 152, 226),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('List ToDo',
                      style: TextStyle(fontSize: 16, color: Colors.blue))
                ])),
        Expanded(
            child: Obx(
          () => ListView.builder(
            itemCount: toDoController.data.value.length,
            itemBuilder: (context, index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(toDoController.data.value[index].name,
                                  style: const TextStyle(fontSize: 16)),
                              Text(toDoController.data.value[index].description)
                            ],
                          )
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            toDoController.deleteTodo(index);
                          },
                          child: const Text('Delele'))
                    ],
                  ),
                ),
              );
            },
          ),
        ))
      ]),
    );
  }
}
