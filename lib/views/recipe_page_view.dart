import 'package:flutter/material.dart';
import 'recipe_view.dart';
import '../controllers/recipe_controller.dart';
import '../models/recipe.dart';

class RecipePageView extends StatefulWidget {
  const RecipePageView({super.key});

  @override
  State<RecipePageView> createState() => _RecipePageViewState();
}

class _RecipePageViewState extends State<RecipePageView> {
  final RecipeController _controller = RecipeController();
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _recipes = _controller.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header ====================================================
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          iconSize: 30,
        ),
        title: const Padding(
          padding: EdgeInsets.zero,
          child: Text(
            'Recipes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 60,
      ),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      // Recipes List
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: _recipes.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final recipe = _recipes[index];
            return _buildRecipeContainer(context, recipe);
          },
        ),
      ),
    );
  }

  // Recipe containers
  Widget _buildRecipeContainer(BuildContext context, Recipe recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeView(recipe: recipe),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Icon Box
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.restaurant,
                  size: 40,
                  color: Color.fromRGBO(34, 171, 82, 1),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Recipe Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe Title
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Recipe Description
                  Text(
                    recipe.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
