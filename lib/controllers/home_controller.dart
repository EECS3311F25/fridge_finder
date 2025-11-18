import '../models/item.dart';
import '../models/fridge.dart';
import '../models/user.dart';

class HomeController {
  final User user;
  final Fridge fridge;
  HomeController({required this.user, required this.fridge});

  /*
  Future<void> refreshFridgeItems() async {
  fridge.items = await ItemDatabaseHelper.queryByFridge(fridge.id!)
      .then((list) => Future.wait(list.map((map) => Item.fromMap(map))));
  }
*/

  List<Item> searchItems(List<Item> items, String query) {
    final lowerQuery = query.toLowerCase().trim();
    if (lowerQuery.isEmpty) return List.from(items);

    return items
        .where((item) => item.name.toLowerCase().contains(lowerQuery))
        .toList();
  }

  List<Item> sortItemsByDateAdded(List<Item> items) {
    items.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
    return items;
  }

  List<Item> sortItemsByExpiryDate(List<Item> items) {
    items.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    return items;
  }
}
