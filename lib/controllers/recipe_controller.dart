class RecipePageController {
  /// Searches for recipes based on the provided [query].

  /// Returns a list of recipe names that match the search term.
  /// Currently uses a placeholder list — in a real app this might call 
  /// a local database, API, or other data source.
  List<String> searchRecipes(String query) {
    // Example static data
    final List<String> allRecipes = [
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

    return allRecipes
        .where((recipe) => recipe.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
