class Recipe {
  final String name;
  final String description;
  final String imagePath;
  final int prepTime; // minutes
  final String difficulty;

  Recipe({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.prepTime,
    required this.difficulty,
  });

  String get formattedPrepTime => "$prepTime min";
}
