import 'package:flutter/material.dart';

/*
Colour Palette: 
Green -> (34, 171, 82, 1)
Off White -> (248, 248, 248, 1)
Box Colour  -> (240, 240, 240, 1)
Text Styles:
Header -> Off White
Food Name -> Size 20, Black
*/

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // List of food names
  final List<String> foodNames = const [
    'Chicken',
    'Bacon',
    'Potato',
    'Molases',
    'Butter',
    'Butter Chicken',
    'Onion',
    'Potato',
  ];

  // List of images
  final List<String> imageTexts = const [
    'IMG',
    'IMG',
    'IMG',
    'IMG',
    'IMG',
    'IMG',
    'IMG',
    'IMG',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: Column(
        children: [
          // Header ====================================================
          Container(
            width: double.infinity,
            color: Color.fromRGBO(34, 171, 82, 1),
            padding: EdgeInsets.all(30),
            child: Text(
              'Fridge Finder',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(248, 248, 248, 1),
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),

          // Search bar  ================================================
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              // Inside the search bar
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(158, 158, 158, 1),
                    fontSize: 16,
                  ),
                  // Search Icon
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),

          // Grid of Items ==============================================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25), // 25 on edges
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 Columns
                  crossAxisSpacing: 20, // 20 between columns
                  mainAxisSpacing: 20, // 20 between rows
                  childAspectRatio: 0.9, // Vertical Space
                ),
                itemCount: foodNames.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Box Container =================================
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // Food Icon =================================
                        child: Center(
                          child: Text(
                            imageTexts[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Food Name =====================================
                      SizedBox(height: 8),
                      Text(
                        foodNames[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
