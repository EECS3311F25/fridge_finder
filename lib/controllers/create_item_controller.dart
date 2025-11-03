import '../models/item.dart';
import '../models/fridge.dart';

class CreateItemController {
  // Hols a new [Item], and assosiates it with a given [Fridge] adding it to the database

  Future<Item> createItem({ // use of Future since to insert an Item we need the response fromn the database and asyncronous functions
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required DateTime expiryDate,
    required Fridge fridge,
    int? fdcId,
  }) async {
    

    if (fridge.id == null) {

      throw Exception('Fridge must be saved before adding items.');
    }


    final item = Item(
      
      fdcId: fdcId,
      name: name,
      quantity: quantity,
      dateAdded: dateAdded,
      expiryDate: expiryDate,
      fridge: fridge,
    );

    // database saver
    final dbHelper = ItemDatabaseHelper.instance;

    
    final itemId = await dbHelper.insert(item);

    // creates copy of the item assosiated with the databse id
    final savedItem = Item(
      id: itemId,
      fdcId: fdcId,
      name: name,
      quantity: quantity,
      dateAdded: dateAdded,
      expiryDate: expiryDate,
      fridge: fridge,
    );

    fridge.items.add(savedItem);

    // update the fridge in the databse
    await FridgeDatabaseHelper.instance.update(fridge);

    return savedItem;
  }
}
