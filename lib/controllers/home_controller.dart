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
<<<<<<< HEAD
    final db = await ItemDatabaseHelper.instance.db; 
=======
    final db = await ItemDatabaseHelper.instance.db;
>>>>>>> 5ccc2ae542b79367554bd7be00cfcd0a4c8b12f1

    final itemMaps = await db.query(
      'item',
      where: 'fridgeId = ?',
      whereArgs: [fridge.id],
    );

    final items = itemMaps.map((map) => Item.fromMap(map)).toList();
<<<<<<< HEAD

    fridge.items
      ..clear()
      ..addAll(items);
=======
>>>>>>> 5ccc2ae542b79367554bd7be00cfcd0a4c8b12f1

    fridge.items
      ..clear()
      ..addAll(items);
  }
}
