import 'package:myproject/state_management/domain/models/todo.dart';

abstract class TodoRepositoryInterface {
  Future<List<Todo>> getTodo();
  Future<List<Todo>> addTodo(Todo item);
}
