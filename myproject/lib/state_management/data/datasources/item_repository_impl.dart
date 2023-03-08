import 'package:myproject/state_management/domain/models/items.dart';
import 'package:myproject/state_management/domain/repositories/item_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<Items> listItems = [];

class ItemRepositoryImpl extends ItemRepositoryInterface {
  @override
  Future<List<Items>> addItem(Items item) async {
    listItems.add(item);
    return listItems;
  }

  @override
  Future<List<Items>> getItems() async {
    return listItems;
  }
}
