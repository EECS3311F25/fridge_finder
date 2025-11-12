import 'dart:ui';

import '../models/item.dart';
import '../models/fridge.dart';

class CreateItemController {
  // Crear un nuevo item y guardarlo en la base de datos
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
    final DateTime now = DateTime.now();

    // Crear y guardar en la base de datos (usa tu función del modelo)
    final Item item = await Item.createAndInsert(
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

  // Eliminar un item del refrigerador y de la base de datos
  Future<void> deleteItem(Item item) async {
    if (item.id == null) {
      throw Exception('Cannot delete an item without an ID.');
    }

    await ItemDatabaseHelper.instance.delete(item.id!);
  }
}
