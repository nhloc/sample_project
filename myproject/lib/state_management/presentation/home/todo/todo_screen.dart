import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/item_repository_impl.dart';
import 'package:myproject/state_management/presentation/home/todo/detail_screen.dart';
import 'package:myproject/state_management/presentation/home/todo/todo_controller.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen({super.key});
  final ToDosController toDosController =
      ToDosController(Get.put(Get.put(ItemRepositoryImpl())));

  void getData() {
    toDosController.getData();
  }

  void addData() async {
    final result = await toDosController.addTodo();
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
                    controller: toDosController.nameWorkController,
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
                    controller: toDosController.descWorkController,
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
                      toDosController.getData();
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
            itemCount: toDosController.data.value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(toDosController.data.value[index].name),
                subtitle: Text(toDosController.data.value[index].describe),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(),
                      settings: RouteSettings(
                        arguments: toDosController.data.value[index],
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
