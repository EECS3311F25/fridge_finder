import 'package:flutter/material.dart';
import 'package:fridge_finder/controllers/home_controller.dart';
import 'food_item_view.dart';
import 'add_item_view.dart';
import 'login_view.dart';
import 'recipe_page_view.dart';
import '../models/item.dart';
import '../controllers/home_controller.dart';
import '../controllers/add_item_controller.dart';
import '../controllers/food_item_controller.dart';

/// This small wrapper keeps HomeView stateless and also allows the creation of new items
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

  HomeView({
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
      // Header ====================================================
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Fridge Finder',
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
        // Account Button (Header)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                icon: const Text(
                  'A',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.zero,
                enableFeedback: false,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
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

          // Filter Selection ========================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                const Text(
                  'Filter by:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton<String>(
                        value: 'Expiring soon',
                        items: const [
                          DropdownMenuItem(
                            value: 'Recently added',
                            child: Text('Recently added'),
                          ),
                          DropdownMenuItem(
                            value: 'Expiring soon',
                            child: Text('Expiring soon'),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          // This is where the functionality of each value will go
                        },
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromRGBO(158, 158, 158, 1),
                        ),
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Grid of Items ==============================================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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
                            child: SizedBox(
                              width: 150,
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        // Item Name
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 150,
                          child: Text(
                            '${item.name} (${item.quantity})',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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

      // Buttons
      floatingActionButton: Stack(
        children: [
          // Button (R)
          Positioned(
            left: 50,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecipePageView(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                radius: 40,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'R',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Button (+)
          Positioned(
            right: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: () async {
                final newItem = await Navigator.push<Item>(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AddItemView(
                          controller: AddItemController(user: homeController.user, fridge: homeController.fridge),
                        ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: animation.drive(
                              Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: Offset.zero,
                              ),
                            ),
                            child: child,
                          );
                        },
                    transitionDuration: const Duration(milliseconds: 200),
                    reverseTransitionDuration: const Duration(
                      milliseconds: 150,
                    ),
                  ),
                );

                if (newItem != null) {
                  onAddItem(newItem);
                }
              },
              child: CircleAvatar(
                backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                radius: 40,
                child: const Icon(Icons.add, color: Colors.white, size: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
