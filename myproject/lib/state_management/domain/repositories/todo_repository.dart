import 'package:myproject/state_management/domain/entities/todo.dart';

abstract class TodoRepositoryInterface {
  Future<List<Todo>> getTodo();
  Future<List<Todo>> addTodo(Todo item);
  Future<List<Todo>> deleteTodo(int id);
}
