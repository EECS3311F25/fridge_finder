import 'package:flutter/material.dart';
import 'food_item_view.dart';
import 'add_item_view.dart';

/*
Colour Palette:
Green -> (34, 171, 82, 1)
Off White -> (248, 248, 248, 1)
Box Colour  -> (240, 240, 240, 1)
Text Styles:
Header -> Off White
Food Name -> Size 20, Black
*/

/// This small wrapper keeps HomeView stateless and also allows the creation of new items
class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  final List<String> _foodNames = [
    'Chicken',
    'Bacon',
    'Potato',
    'Molases',
    'Butter',
    'Butter Chicken',
    'Onion',
    'Potato',
  ];

  void _addNewItem(String newItem) {
    setState(() {
      _foodNames.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      foodNames: _foodNames,
      onAddItem: _addNewItem,
    );
  }
}

class HomeView extends StatelessWidget {
  final List<String> foodNames;
  final Function(String) onAddItem;

  const HomeView({
    super.key,
    required this.foodNames,
    required this.onAddItem,
  });

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
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: Column(
        children: [
          // Header ====================================================
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(34, 171, 82, 1),
            padding: const EdgeInsets.all(30),
            child: const Text(
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
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(158, 158, 158, 1),
                    fontSize: 16,
                  ),
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 Columns
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: foodNames.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodItemView(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        // Box Container =================================
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(240, 240, 240, 1),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              imageTexts[index % imageTexts.length],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          foodNames[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Button (+)
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
        shape: const CircleBorder(),
        onPressed: () async {
          final newItem = await Navigator.push<String>(
            context,
            MaterialPageRoute(builder: (context) => const AddItemView()),
          );

          if (newItem != null) {
            onAddItem(newItem);
          }
        },
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }
}
