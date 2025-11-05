import 'dart:ui';

import '../models/item.dart';
import '../models/fridge.dart';

class CreateItemController {
  // Hols a new [Item], and assosiates it with a given [Fridge] adding it to the database

  Future<Item> createItem({
    // use of Future since to insert an Item we need the response fromn the database and asyncronous functions
    int? fdcId,
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required DateTime expiryDate,
    required Fridge fridge,
    Image? imageIcon,
  }) async {
    Item item = await Item.createAndInsert(
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
