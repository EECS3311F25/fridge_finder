import 'package:flutter/material.dart';
import 'food_item_view.dart';
import 'add_item_view.dart';
import '../models/item.dart';
import '../controllers/home_controller.dart';
import '../controllers/add_item_controller.dart';
import '../controllers/food_item_controller.dart';

/*
Colour Palette:
Green -> (34, 171, 82, 1)
Off White -> (248, 248, 248, 1)
Box Colour  -> (240, 240, 240, 1)
Text Styles:
Header -> Off White
Food Name -> Size 20, Black
*/


class HomeWrapper extends StatefulWidget {
  final HomeController homeController;
  const HomeWrapper({super.key, required this.homeController});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  final TextEditingController _searchController = TextEditingController();
  late final HomeController _homeController;

  List<Item> _filteredItems = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _homeController = widget.homeController;

    // Al inicio, mostramos todos los items del fridge del controller
    _filteredItems = _homeController.fridge.items;

    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _filteredItems = _homeController.searchItems(
        _homeController.fridge.items,
        _searchQuery,
      );
    });
  }

  void _onDeleteItem(Item item) {
    //  (real logic in controller) in here im assuming that the controller already deleted the item, and the view its just updated
    setState(() {
      _filteredItems = _homeController.searchItems(
        _homeController.fridge.items,
        _searchQuery,
      );
    });
  }

  void _onAddItem(Item newItem) {
   //same thing that with DeleteItem
    setState(() {
      _filteredItems = _homeController.searchItems(
        _homeController.fridge.items,
        _searchQuery,
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      items: _filteredItems,
      onAddItem: _onAddItem,
      onDeleteItem: _onDeleteItem,
      searchController: _searchController,
      homeController: _homeController,
    );
  }
}

class HomeView extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onAddItem;
  final Function(Item) onDeleteItem;
  final TextEditingController searchController;
  final HomeController homeController;

  const HomeView({
    super.key,
    required this.items,
    required this.onAddItem,
    required this.onDeleteItem,
    required this.searchController,
    required this.homeController,
  });

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
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
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
                  crossAxisCount: 2, // 2 Columns of items
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodItemView(
                            item: item,
                            onDelete: (itemToDelete) {
                              onDeleteItem(itemToDelete); //refreshes home
                            },
                            controller: FoodItemController(
                              user: homeController.user,
                              fridge: homeController.fridge,
                              item: item,
                            ),
                          ),
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
                          ),
                          // Image Placeholder
                          child: Center(
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // Item Name
                        const SizedBox(height: 8),
                        Text(
                          '${item.name} (${item.quantity})',
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
      floatingActionButton: CircleAvatar(
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
        radius: 40,
        child: IconButton(
          onPressed: () async {
            final addItemController = AddItemController(
              user: homeController.user,
              fridge: homeController.fridge,
            );

            final newItem = await Navigator.push<Item>(
              context,
              MaterialPageRoute(
                builder: (context) => AddItemView(controller: addItemController),
              ),
            );

            if (newItem != null) {
              // just refresh the UI
              onAddItem(newItem);
            }
          },
          icon: const Icon(Icons.add, color: Colors.white, size: 40),
          padding: EdgeInsets.zero,
          enableFeedback: false,
        ),
      ),
    );
  }
}
