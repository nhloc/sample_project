import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/data/datasources/item_repository_impl.dart';
import 'package:myproject/state_management/domain/models/items.dart';
import 'package:myproject/state_management/presentation/home/home_controller.dart';
import 'package:myproject/state_management/presentation/home/homepage_screen.dart';
import 'package:myproject/state_management/presentation/home/todo/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomePage();
}

class _HomePage extends State<HomeScreen> {
  final HomeController homeController =
      HomeController(Get.put(Get.put(ItemRepositoryImpl())));
  int _selectedIndex = 0;
  List<Items> todos = [];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: _selectedIndex,
          children: [HomePageScreen(), TodosScreen(), UserPageScreen()],
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'ToDos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
