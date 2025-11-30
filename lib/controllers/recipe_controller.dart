import '../models/recipe.dart';

class RecipeController {
  // ---------- SINGLETON SETUP ----------
  static final RecipeController _instance = RecipeController._internal();
  factory RecipeController() => _instance;
  RecipeController._internal();
  // -------------------------------------

  // List of all recipes
  final List<Recipe> _recipes = [
    Recipe(
      name: "Apple Pie",
      description:
          "A delicious classic Apple Pie made with fresh apples and baked to perfection.",
      imagePath: "assets/images/apple_pie.jpg",
      prepTime: 45,
      difficulty: "Medium",
    ),
    Recipe(
      name: "Banana Bread",
      description:
          "A moist banana bread perfect for breakfast or a sweet snack.",
      imagePath: "assets/images/banana_bread.jpg",
      prepTime: 60,
      difficulty: "Easy",
    ),
    Recipe(
      name: "Chicken Alfredo",
      description:
          "Creamy chicken pasta with Parmesan cheese and fresh herbs.",
      imagePath: "assets/images/chicken_alfredo.jpg",
      prepTime: 30,
      difficulty: "Medium",
    ),
    Recipe(
      name: "Caesar Salad",
      description:
          "A fresh Caesar salad with crunchy croutons and homemade dressing.",
      imagePath: "assets/images/caesar_salad.jpg",
      prepTime: 20,
      difficulty: "Easy",
    ),
    Recipe(
      name: "Beef Wellington",
      description:
          "A gourmet dish featuring beef tenderloin wrapped in puff pastry, mushrooms, and prosciutto. Crispy, juicy, and perfect for special dinners.",
      imagePath: "assets/images/beef_wellington.jpg",
      prepTime: 90, // BETWEEN 60 and 120
      difficulty: "Hard", // HARD RECIPE
    ),

    Recipe(
      name: "Chocolate Mousse",
      description:
          "A rich and airy chocolate dessert made with whipped cream and melted chocolate.",
      imagePath: "assets/images/chocolate_mousse.jpg",
      prepTime: 25,
      difficulty: "Medium",
    ),

    Recipe(
      name: "Veggie Stir Fry",
      description:
          "Fresh vegetables sautéed with soy sauce, garlic, and ginger. Healthy and fast.",
      imagePath: "assets/images/veggie_stir_fry.jpg",
      prepTime: 20,
      difficulty: "Easy",
    ),
  ];

  // Store favorites by name
  final Set<String> _favoriteRecipeNames = {};

  // Get all recipes
  List<Recipe> getRecipes() => List.from(_recipes);

  // Favorite operations
  bool isFavorite(Recipe recipe) {
    return _favoriteRecipeNames.contains(recipe.name);
  }

  void toggleFavorite(Recipe recipe) {
    if (isFavorite(recipe)) {
      _favoriteRecipeNames.remove(recipe.name);
    } else {
      _favoriteRecipeNames.add(recipe.name);
    }
  }

  List<Recipe> getFavorites() {
    return _recipes.where(isFavorite).toList();
  }

  // Filtering
  List<Recipe> filterRecipes({
    String? difficulty,
    int? maxPrepTime,
    bool onlyFavorites = false,
  }) {
    Iterable<Recipe> filtered = _recipes;

    if (onlyFavorites) {
      filtered = filtered.where(isFavorite);
    }

    if (difficulty != null && difficulty != "All") {
      filtered = filtered.where((r) =>
          r.difficulty.toLowerCase() == difficulty.toLowerCase());
    }

    if (maxPrepTime != null) {
      filtered = filtered.where((r) => r.prepTime <= maxPrepTime);
    }

    return filtered.toList();
  }
}
