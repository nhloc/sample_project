import 'package:myproject/state_management/domain/models/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

final List<Todo> listItems = [];

class ItemRepositoryImpl extends TodoRepositoryInterface {
  @override
  Future<List<Todo>> addTodo(Todo item) async {
    listItems.add(item);
    return listItems;
  }

  @override
  Future<List<Todo>> getTodo() async {
    return listItems;
  }
}
