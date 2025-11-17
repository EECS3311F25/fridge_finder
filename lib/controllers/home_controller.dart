import '../models/item.dart';
import '../models/fridge.dart';
import '../models/user.dart';

class HomeController {
  final User user;
  final Fridge fridge;
  HomeController({required this.user, required this.fridge});
  
  List<Item> searchItems(List<Item> items, String query) {
    final lowerQuery = query.toLowerCase().trim();
    if (lowerQuery.isEmpty) return List.from(items);

    return items
        .where((item) => item.name.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
