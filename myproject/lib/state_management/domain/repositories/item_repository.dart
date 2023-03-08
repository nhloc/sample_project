import 'package:myproject/state_management/domain/models/items.dart';

abstract class ItemRepositoryInterface {
  Future<List<Items>> getItems();
  Future<List<Items>> addItem(Items item);
}
