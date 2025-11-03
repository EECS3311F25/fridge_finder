import 'package:flutter/material.dart';

class FoodItemView extends StatefulWidget {
  const FoodItemView({super.key});

  @override
  State<FoodItemView> createState() => _FoodItemViewState();
}

class _FoodItemViewState extends State<FoodItemView> {
  String itemName = 'Apple';
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

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
          // Content Below Header
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ), // 25 on edges
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Food Title ==============================================
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between title and box
                  // Box Container ===========================================
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: const Center(
                      child: Text(
                        'IMG',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Quantity Row ============================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Quantity Text
                      Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 20),
                      // - X + Buttons ======================================
                      Row(
                        children: [
                          // - Button
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(34, 171, 82, 1),
                            radius: 20,
                            child: IconButton(
                              onPressed: decreaseQuantity,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                              padding: EdgeInsets.zero,
                              enableFeedback: false, // Remove sound effect
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Quantity Value
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 20),
                          // + Button
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(34, 171, 82, 1),
                            radius: 20,
                            child: IconButton(
                              onPressed: increaseQuantity,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                              padding: EdgeInsets.zero,
                              enableFeedback: false, // Remove sound effect
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // Divider Line ============================================
                  Container(
                    width: 200,
                    height: 1,
                    color: const Color.fromARGB(255, 186, 186, 186),
                  ),
                  const SizedBox(height: 20),
                  // Added/Expires Container =================================
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        // Added Container
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Added Text
                            Text(
                              'Added',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            // Date
                            Text(
                              'MM/DD/YYYY',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Expires Container
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Expires Text
                            Text(
                              'Expires',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            // Date
                            Text(
                              'MM/DD/YYYY',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
