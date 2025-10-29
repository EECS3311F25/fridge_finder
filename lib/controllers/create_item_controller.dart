import '../models/item.dart';
import '../models/fridge.dart';

class CreateItemController {
  /// Creates and returns a new [Item] associated with the given [Fridge].
  Item createItem(
    String name,
    int quantity,
    DateTime expiryDate,
    Fridge fridge, {
    int? fdcId,
  }) {
    final item = Item(
      fdcId: fdcId,
      name: name,
      quantity: quantity,
      expiryDate: expiryDate,
      fridge: fridge,
    );

    fridge.items.add(item);

    // Optionally save to database if ItemDatabaseHelper allows it
    // await ItemDatabaseHelper.instance.insertItem(item);

    return item;
  }
}
