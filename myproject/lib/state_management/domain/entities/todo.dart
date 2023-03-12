import 'package:myproject/state_management/domain/entities/ientity.dart';

class Todo{
  
  const Todo(this.id, this.name, this.description);
  final int? id;
  final String name;
  final String description;

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'description': description};
}
