import 'dart:async';
import '../models/item.dart';
import '../models/fridge.dart';
import '../models/user.dart';

class HomeController {
  final User user;
  final Fridge fridge;

  HomeController({required this.user, required this.fridge});

  Future<void> deleteItem(Fridge fridge, Item item) async {
    fridge.items.remove(item);
    if (item.id != null) {
      await ItemDatabaseHelper.instance.delete(item.id!);
    }
  }

  List<Item> searchItems(String query) {
    final lowerQuery = query.toLowerCase();
    return fridge.items
        .where((item) => item.name.toLowerCase().contains(lowerQuery))
        .toList();
  }

  Future<void> loadItemsFromDb(Fridge fridge) async {
    final db = await ItemDatabaseHelper.instance.db;

    final itemMaps = await db.query(
      'item',
      where: 'fridgeId = ?',
      whereArgs: [fridge.id],
    );

    final items = itemMaps.map((map) => Item.fromMap(map)).toList();

    fridge.items
      ..clear()
      ..addAll(items);
  }
}
