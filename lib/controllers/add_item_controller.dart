import 'dart:ui';
import '../models/item.dart';
import '../models/fridge.dart';
import '../models/user.dart';

class AddItemController {
  final User user;
  final Fridge fridge;

  AddItemController({required this.user, required this.fridge});

  // Hols a new [Item], and assosiates it with a given [Fridge] adding it to the database
  Future<Item> createItem({
    int? fdcId,
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required DateTime expiryDate,
    Image? imageIcon,
  }) async {
    final item = await Item.createAndInsert(
      fdcId,
      name,
      quantity,
      dateAdded,
      expiryDate,
      fridge,
      imageIcon,
    );

    fridge.items.add(item);

    return item;
  }
}
