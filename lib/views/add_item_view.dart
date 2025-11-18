import 'package:flutter/material.dart';
import '../models/item.dart';
import '../controllers/add_item_controller.dart';

class AddItemView extends StatefulWidget {
  final AddItemController controller;

  const AddItemView({super.key, required this.controller});

  @override
  State<AddItemView> createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  // variables for the input
  String _foodName = '';
  String? _selectedIcon;
  DateTime? _expiryDate;
  int _addFoodQuantity = 1;

  final List<String> _imagePaths = ['assets/images/appleIcon.png'];

  // Text editing controller for the food name
  final TextEditingController _foodNameController = TextEditingController();

  // ===== Icon selector =====
  void _openIconSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: _imagePaths.length,
            itemBuilder: (context, index) {
              final path = _imagePaths[index];
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedIcon = path);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedIcon == path
                          ? const Color.fromRGBO(34, 171, 82, 1)
                          : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(path, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // ===== Date picker =====
  Future<void> _pickExpiryDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(34, 171, 82, 1),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _expiryDate = picked);
    }
  }

  // ===== Quantity controls =====
  void _incrementQuantity() {
    setState(() => _addFoodQuantity++);
  }

  void _decrementQuantity() {
    setState(() {
      if (_addFoodQuantity > 1) _addFoodQuantity--;
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
            'Add Item',
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
            // ====== FOOD NAME ======
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: TextField(
                controller: _foodNameController,
                onChanged: (value) {
                  setState(() {
                    _foodName = value;
                  });
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: _foodName.isEmpty ? 'Enter item name' : _foodName,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                  counterText: "",
                ),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLength: 16,
              ),
            ),

            const SizedBox(height: 30),

            // ====== ICON SELECTOR ======
            GestureDetector(
              onTap: _openIconSelector,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _selectedIcon == null
                    ? const Center(
                        child: Text(
                          'Select icon',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(158, 158, 158, 1),
                          ),
                        ),
                      )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(_selectedIcon!, fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ====== EXPIRY DATE ======
            GestureDetector(
              onTap: _pickExpiryDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _expiryDate == null
                            ? 'Select expiry date'
                            : '${_expiryDate!.month}/${_expiryDate!.day}/${_expiryDate!.year}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 122, 122, 122),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ====== DIVIDER ======
            Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 186, 186, 186),
            ),

            const SizedBox(height: 30),

            // ====== QUANTITY ======
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Quantity',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    // -
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                      radius: 20,
                      child: IconButton(
                        onPressed: _decrementQuantity,
                        icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // value
                    Text(
                      _addFoodQuantity.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // +
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                      radius: 20,
                      child: IconButton(
                        onPressed: _incrementQuantity,
                        icon: const Icon(Icons.add, color: Colors.white, size: 18),
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ===== Add Button =====
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () async {
                  final newItem = await widget.controller.createItem(
                    name: _foodName.trim(),
                    quantity: _addFoodQuantity,
                    dateAdded: DateTime.now(),
                    expiryDate: _expiryDate ?? DateTime.now().add(const Duration(days: 7)),
                    imagePath: "",
                  );
                  Navigator.pop(context, newItem);
                },
                child: const Text(
                  'Add',
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
