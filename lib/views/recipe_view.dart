import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../controllers/recipe_controller.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;

  const RecipeView({super.key, required this.recipe});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final RecipeController _controller = RecipeController();

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    final isFav = _controller.isFavorite(recipe);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.star : Icons.star_border,
              color: Colors.yellow,
              size: 32,
            ),
            onPressed: () {
              setState(() {
                _controller.toggleFavorite(recipe);
              });
            },
          )
        ],
      ),

      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // IMAGE
            Container(
              height: 250,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              child: Image.asset(recipe.imagePath, fit: BoxFit.cover),
            ),

            const SizedBox(height: 20),

            // DESCRIPTION
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                recipe.description,
                style: const TextStyle(fontSize: 20, height: 1.4),
              ),
            ),

            // INFO ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("⏱ ${recipe.prepTime} min",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("⭐ ${recipe.difficulty}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
