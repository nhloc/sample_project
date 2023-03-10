import 'package:get/get.dart';
import 'package:myproject/state_management/domain/models/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

class HomeController extends GetxController {
  final ItemRepositoryInterface itemRepositoryInterface;
  HomeController(this.itemRepositoryInterface);

  Future<List<Todo>> getData() async {
    final data = await itemRepositoryInterface.getTodo();
    return data;
  }
}
