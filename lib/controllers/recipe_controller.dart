import '../models/recipe.dart';

class RecipeController {
  // Example static data
  final List<Recipe> _allRecipes = [
    Recipe(
      name: 'Spaghetti Bolognese',
      description: 'A classic Italian pasta dish with rich meat sauce.',
    ),
    Recipe(
      name: 'Chicken Curry',
      description: 'Spicy and creamy chicken curry with rice.',
    ),
    Recipe(
      name: 'Beef Stroganoff',
      description: 'Tender beef strips in a creamy mushroom sauce.',
    ),
    Recipe(
      name: 'Vegetable Stir Fry',
      description: 'Fresh vegetables stir-fried with soy sauce and ginger.',
    ),
    Recipe(
      name: 'Fish Tacos',
      description: 'Crispy fish tacos with slaw and lime crema.',
    ),
    Recipe(
      name: 'Lentil Soup',
      description: 'Hearty and healthy lentil soup with carrots and celery.',
    ),
    Recipe(
      name: 'Caesar Salad',
      description: 'Crisp romaine lettuce with parmesan, croutons and caesar dressing.',
    ),
    Recipe(
      name: 'Pancakes',
      description: 'Fluffy pancakes served with maple syrup and butter.',
    ),
    Recipe(
      name: 'Chocolate Cake',
      description: 'Rich and moist chocolate cake with ganache frosting.',
    ),
    Recipe(
      name: 'Apple Pie',
      description: 'Classic apple pie with a flaky crust and cinnamon filling.',
    ),
  ];

  /// Returns all available recipes.
  List<Recipe> getAllRecipes() {
    return _allRecipes;
  }

  /// Searches for recipes based on the provided [query].
  List<Recipe> searchRecipes(String query) {
    if (query.isEmpty) {
      return _allRecipes;
    }
    return _allRecipes
        .where((recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

