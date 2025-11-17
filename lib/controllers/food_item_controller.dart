import '../models/item.dart';
import '../models/fridge.dart';

class FoodItemController {
  Fridge fridge;
  Item item;

  FoodItemController({required this.fridge, required this.item});

  void deleteItem() async {
    await ItemDatabaseHelper.instance.delete(item.id!);
    fridge.items.remove(item);
  }

  void freezeItem() {
    item.frozen = true;
    item.frozenDifferential = item.expiryDate.difference(item.dateAdded).inDays;
  }

  void updateQuantity(int diff) {
    item.quantity += diff;
  }
}