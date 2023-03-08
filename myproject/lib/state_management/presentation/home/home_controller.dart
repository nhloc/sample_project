import 'package:get/get.dart';
import 'package:myproject/state_management/domain/models/items.dart';
import 'package:myproject/state_management/domain/repositories/item_repository.dart';

class HomeController extends GetxController {
  final ItemRepositoryInterface itemRepositoryInterface;
  HomeController(this.itemRepositoryInterface);

  Future<List<Items>> getData() async {
    final data = await itemRepositoryInterface.getItems();
    return data;
  }
}
