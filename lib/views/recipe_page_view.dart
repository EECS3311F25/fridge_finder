import 'package:flutter/material.dart';
import 'recipe_view.dart';
import '../models/recipe.dart';
import '../controllers/recipe_controller.dart';

class RecipePageView extends StatefulWidget {
  const RecipePageView({super.key});

  @override
  State<RecipePageView> createState() => _RecipePageViewState();
}

class _RecipePageViewState extends State<RecipePageView> {
  final RecipeController _recipeController = RecipeController();

  String _selectedDifficulty = "All";
  double _maxPrepTime = 120;
  bool _showFavoritesOnly = false;

  late List<Recipe> _filteredRecipes;

  @override
  void initState() {
    super.initState();
    _filteredRecipes = _recipeController.getRecipes();
  }

  void _applyFilters() {
    setState(() {
      _filteredRecipes = _recipeController.filterRecipes(
        difficulty: _selectedDifficulty,
        maxPrepTime: _maxPrepTime.toInt(),
        onlyFavorites: _showFavoritesOnly,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 30,
        ),
        title: const Text(
          'Recipes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
      ),

      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // ---------------------- FILTERS ------------------------
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedDifficulty,
                    decoration: const InputDecoration(
                      labelText: "Difficulty",
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: "All", child: Text("All")),
                      DropdownMenuItem(value: "Easy", child: Text("Easy")),
                      DropdownMenuItem(value: "Medium", child: Text("Medium")),
                      DropdownMenuItem(value: "Hard", child: Text("Hard")),
                    ],
                    onChanged: (value) {
                      _selectedDifficulty = value!;
                      _applyFilters();
                    },
                  ),
                ),

                const SizedBox(width: 16),

                // Max time filter
                Expanded(
                  child: DropdownButtonFormField<double>(
                    value: _maxPrepTime,
                    decoration: const InputDecoration(
                      labelText: "Max Time",
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 20, child: Text("20 min")),
                      DropdownMenuItem(value: 30, child: Text("30 min")),
                      DropdownMenuItem(value: 45, child: Text("45 min")),
                      DropdownMenuItem(value: 60, child: Text("60 min")),
                      DropdownMenuItem(value: 120, child: Text("120 min")),
                    ],
                    onChanged: (value) {
                      _maxPrepTime = value!;
                      _applyFilters();
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Favorite filter
            SwitchListTile(
              value: _showFavoritesOnly,
              onChanged: (val) {
                _showFavoritesOnly = val;
                _applyFilters();
              },
              title: const Text(
                "Show only favorites",
                style: TextStyle(fontSize: 18),
              ),
              activeColor: const Color.fromRGBO(34, 171, 82, 1),
            ),

            const SizedBox(height: 20),

            // ---------------------- RECIPE LIST ------------------------
            Expanded(
              child: ListView.separated(
                itemCount: _filteredRecipes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final recipe = _filteredRecipes[index];
                  return _buildRecipeContainer(context, recipe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeContainer(BuildContext context, Recipe recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RecipeView(recipe: recipe)),
        ).then((_) => _applyFilters());
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Thumbnail
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(240, 240, 240, 1),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(recipe.imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),

            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),

                  Text(recipe.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Colors.grey.shade700)),

                  const SizedBox(height: 6),

                  Text("⏱ ${recipe.prepTime} min • ⭐ ${recipe.difficulty}",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
