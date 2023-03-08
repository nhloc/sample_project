import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myproject/state_management/domain/models/items.dart';
import 'package:myproject/state_management/domain/repositories/item_repository.dart';

class ToDosController extends GetxController {
  ItemRepositoryInterface itemRepositoryInterface;
  ToDosController(this.itemRepositoryInterface);

  TextEditingController nameWorkController = TextEditingController();
  TextEditingController descWorkController = TextEditingController();
  var data = RxList<Items>([]).obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final listData = await itemRepositoryInterface.getItems();
    if (listData.isNotEmpty) {
      data.value.clear();
      data.value.addAll(listData);
    }
  }

  Future<bool> addTodo() async {
    final name = nameWorkController.text;
    final describe = descWorkController.text;
    if (name == '') {
      return false;
    }
    final listData = await itemRepositoryInterface
        .addItem(Items(data.value.length + 1, name, describe));
    nameWorkController.clear();
    descWorkController.clear();
    data.value.clear();
    data.value.addAll(listData);
    return true;
  }
}
