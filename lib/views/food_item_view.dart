import 'package:flutter/material.dart';
import '../models/item.dart';
import '../views/home_view.dart';

class FoodItemView extends StatefulWidget {
  final Item item;
  final Function(Item) onDelete;

  const FoodItemView({super.key, required this.item, required this.onDelete,});

  @override
  State<FoodItemView> createState() => _FoodItemViewState();
}

class _FoodItemViewState extends State<FoodItemView> {
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
            'Food Item',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Food Title ==============================================
            Text(
              widget.item.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Box Container ===========================================
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  widget.item.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
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
                const Text(
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
                      backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                      radius: 20,
                      child: IconButton(
                        onPressed: decreaseQuantity,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18,
                        ),
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                      ),
                    ),
                    const SizedBox(width: 20),

                    // Quantity Value
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 20),

                    // + Button
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                      radius: 20,
                      child: IconButton(
                        onPressed: increaseQuantity,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Divider Line ============================================
            Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 186, 186, 186),
            ),

            const SizedBox(height: 20),

            // Added/Expires Container =================================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Added Container
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Added',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${widget.item.dateAdded.month}/${widget.item.dateAdded.day}/${widget.item.dateAdded.year}',
                      style: const TextStyle(
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
                    const Text(
                      'Expires',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${widget.item.expiryDate.month}/${widget.item.expiryDate.day}/${widget.item.expiryDate.year}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Second Divider Line =====================================
            Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 186, 186, 186),
            ),

            const SizedBox(height: 20),

            // Storage Info Text =======================================
            const Text(
              'Storage Info',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            // Storage Info Description ================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Keep in orginal packaging',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            // Third Divider Line ======================================
            Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 186, 186, 186),
            ),

            const SizedBox(height: 20),

            // Freeze Button ===========================================
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // onPressed for the freeze button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(66, 133, 244, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Freeze',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
