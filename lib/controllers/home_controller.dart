import '../models/item.dart';

class HomeController {
  List<Item> searchItems(List<Item> items, String query) {
    final lowerQuery = query.toLowerCase().trim();
    if (lowerQuery.isEmpty) return List.from(items);

    return items
        .where((item) => item.name.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
