import '../models/item.dart';
import '../models/fridge.dart';
import '../models/user.dart';

class FoodItemController {
  final User user;
  final Fridge fridge;
  final Item item;

  FoodItemController({required this.user, required this.fridge, required this.item,});
  
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
    if (item.id != null) {
      await ItemDatabaseHelper.instance.delete(item.id!);
    }
  }
}
