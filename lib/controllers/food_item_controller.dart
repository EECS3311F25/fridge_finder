import '../models/item.dart';
import '../models/fridge.dart';
import '../models/user.dart';

class FoodItemController {
  final User user;
  final Fridge fridge;
  final Item item;

  FoodItemController({
    required this.user,
    required this.fridge,
    required this.item,
  });

  Future<void> increaseQuantity(Item item) async {
    item.quantity++;
    await ItemDatabaseHelper.instance.update(item);
  }

  Future<void> decreaseQuantity(Item item) async {
    if (item.quantity > 0) {
      item.quantity--;
      await ItemDatabaseHelper.instance.update(item);
    }
  }

  Future<void> deleteItem(Item item) async {
    await ItemDatabaseHelper.instance.delete(item.id!);
    fridge.items.remove(item);
  }

  Future<void> freezeItem() async {
    item.frozen = true;
    item.frozenDifferential = item.expiryDate.difference(item.dateAdded).inDays;
    await ItemDatabaseHelper.instance.update(item);
  }
}
