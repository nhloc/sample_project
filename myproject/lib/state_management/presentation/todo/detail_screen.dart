import 'package:flutter/material.dart';
import 'package:myproject/state_management/domain/models/items.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Items;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.describe),
      ),
    );
  }
}