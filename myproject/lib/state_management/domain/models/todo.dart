class Todo {
  
  const Todo(this.id, this.name, this.describe);
  final int id;
  final String name;
  final String describe;

  // Items.fromJson(Map<String, dynamic> json)
  //     : id = json['id'] as int,
  //       name = json['name'],
  //       describe = json['describe'];

  // Map<String, dynamic> toJson() =>
  //     {'id': id, 'name': name, 'describe': describe};
}
