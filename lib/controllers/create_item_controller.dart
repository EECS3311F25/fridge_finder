import 'dart:ui';
import '../models/item.dart';
import '../models/fridge.dart';

class CreateItemController {
  // Crear un nuevo item y guardarlo en la base de datos
  Future<Item> createItem({
    required String name,
    required int quantity,
    required DateTime expiryDate,
    required Fridge fridge,
    Image? imageIcon,
    int? fdcId,
  }) async {
    final DateTime now = DateTime.now();

    // Crear y guardar en la base de datos (usa tu función del modelo)
    final Item item = await Item.createAndInsert(
      fdcId,
      name,
      quantity,
      now,
      expiryDate,
      fridge,
      imageIcon,
    );

    // Agregarlo al objeto Fridge actual
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
