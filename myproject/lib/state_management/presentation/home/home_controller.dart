import 'package:get/get.dart';
import 'package:myproject/state_management/domain/entities/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

class HomeController extends GetxController {
  final TodoRepositoryInterface itemRepositoryInterface;
  HomeController(this.itemRepositoryInterface);

  Future<List<Todo>> getData() async {
    final data = await itemRepositoryInterface.getTodo();
    return data;
  }
}
