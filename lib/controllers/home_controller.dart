import 'dart:async';
import '../models/item.dart';
import '../models/fridge.dart';

class HomeController {
  final Fridge fridge;

  HomeController({required this.fridge});

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
}
