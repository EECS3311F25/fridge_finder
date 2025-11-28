import '../models/item.dart';

class FilterItemController {
  
  /// Filters the list of items by name based on the query.
  List<Item> filterByName(List<Item> items, String query) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  /// Filters the list of items by their frozen status.
  List<Item> filterByFrozen(List<Item> items, bool frozen) {
    return items.where((item) => item.frozen == frozen).toList();
  }

  /// Sorts items by the closest expiry date.
  List<Item> sortByExpiryDate(List<Item> items) {
    items.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    return items;
  }

  /// Sorts items by the date they were added.
  List<Item> sortByDateAdded(List<Item> items, {bool ascending = true}) {
    items.sort((a, b) {
      return ascending 
          ? a.dateAdded.compareTo(b.dateAdded) 
          : b.dateAdded.compareTo(a.dateAdded);
    });
    return items;
  }

  /// Sorts items by their expiry date.
  List<Item> sortByExpiryDate(List<Item> items, {bool ascending = true}) {
    items.sort((a, b) {
      return ascending 
          ? a.expiryDate.compareTo(b.expiryDate) 
          : b.expiryDate.compareTo(a.expiryDate);
    });
    return items;
  }
}
