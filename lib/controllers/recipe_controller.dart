class RecipeController {
  // Example static data
  final List<String> _allRecipes = [
    'Spaghetti Bolognese',
    'Chicken Curry',
    'Beef Stroganoff',
    'Vegetable Stir Fry',
    'Fish Tacos',
    'Lentil Soup',
    'Caesar Salad',
    'Pancakes',
    'Chocolate Cake',
    'Apple Pie',  
  ];

  /// Returns all available recipes.
  List<String> getAllRecipes() {
    return _allRecipes;
  }

  /// Searches for recipes based on the provided [query].
  List<String> searchRecipes(String query) {
    if (query.isEmpty) {
      return _allRecipes;
    }
    return _allRecipes
        .where((recipe) => recipe.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
