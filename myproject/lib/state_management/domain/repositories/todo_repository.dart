import 'package:myproject/state_management/domain/models/todo.dart';

abstract class ItemRepositoryInterface {
  Future<List<Todo>> getTodo();
  Future<List<Todo>> addTodo(Todo item);
}
