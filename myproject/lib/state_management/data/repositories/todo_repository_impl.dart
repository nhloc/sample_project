import 'package:myproject/state_management/core/helper/database_help.dart';
import 'package:myproject/state_management/domain/entities/todo.dart';
import 'package:myproject/state_management/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepositoryInterface {
  @override
  Future<List<Todo>> addTodo(Todo item) async {
    // Insert data
    await DatabaseHelper.instance.insertTable("ms_todos", item.toJson());
    // Get all data after insert
    final data = await DatabaseHelper.instance
        .queryAllRowsTable(DatabaseHelper.table_todo);
    return data.map((data) => Todo.fromJson(data)).toList();
  }

  @override
  Future<List<Todo>> getTodo() async {
    final data = await DatabaseHelper.instance
        .queryAllRowsTable(DatabaseHelper.table_todo);
    return data.map((data) => Todo.fromJson(data)).toList();
  }

  @override
  Future<List<Todo>> deleteTodo(int id) async {
    await DatabaseHelper.instance.deleteTable(DatabaseHelper.table_todo, id);
    final data = await DatabaseHelper.instance
        .queryAllRowsTable(DatabaseHelper.table_todo);
    return data.map((data) => Todo.fromJson(data)).toList();
  }
}
