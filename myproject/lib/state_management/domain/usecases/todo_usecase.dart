import 'package:myproject/state_management/domain/entities/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

class TodoGetDataUseCase {
  final TodoRepositoryInterface repository;
  TodoGetDataUseCase(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getTodo();
  }
}

class TodoAddUseCase {
  final TodoRepositoryInterface repository;
  TodoAddUseCase(this.repository);

  Future<List<Todo>> call(Todo item) async {
    return await repository.addTodo(item);
  }
}

class TodoDeleteUseCase {
  final TodoRepositoryInterface repository;
  TodoDeleteUseCase(this.repository);

  Future<List<Todo>> call(int id) async {
    return await repository.deleteTodo(id);
  }
}
