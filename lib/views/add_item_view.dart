import 'package:flutter/material.dart';
import '../controllers/create_item_controller.dart';
import '../models/item.dart';
import '../models/fridge.dart';

class AddItemView extends StatefulWidget {
  final Fridge fridge; // 🔹 Se pasa el fridge al crear el item
  const AddItemView({super.key, required this.fridge});

  @override
  State<AddItemView> createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  final CreateItemController _controller = CreateItemController();

  String? _selectedFood;
  String? _selectedIcon;
  DateTime? _expiryDate;
  int _addFoodQuantity = 1;

  final List<String> _foodOptions = ['Apple', 'Banana', 'Carrot'];
  final List<String> _imagePaths = [
    'assets/images/chicken.png',
    'assets/images/bacon.png',
    'assets/images/butter.png',
    'assets/images/milk.png',
    'assets/images/potato.png',
  ];

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

  // Selector de fecha
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
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) setState(() => _expiryDate = picked);
  }

  // Controles de cantidad
  void _incrementQuantity() => setState(() => _addFoodQuantity++);
  void _decrementQuantity() =>
      setState(() => _addFoodQuantity = _addFoodQuantity > 1 ? _addFoodQuantity - 1 : 1);

  // Lógica del botón ADD
  Future<void> _handleAdd() async {
    if (_selectedFood == null || _expiryDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      final newItem = await _controller.createItem(
        name: _selectedFood!,
        quantity: _addFoodQuantity,
        expiryDate: _expiryDate!,
        fridge: widget.fridge,
      );

      Navigator.pop(context, newItem); // Devuelve el nuevo item al home
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding item: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled =
        _selectedFood != null && _selectedIcon != null && _expiryDate != null && _addFoodQuantity > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Item',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== FOOD NAME ======
            const Text('Food Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedFood,
              hint: const Text('Select a food'),
              onChanged: (value) => setState(() => _selectedFood = value),
              items: _foodOptions.map((food) {
                return DropdownMenuItem(value: food, child: Text(food));
              }).toList(),
            ),

            const SizedBox(height: 30),

            // ====== ICON ======
            const Text('Icon', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _openIconSelector,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _selectedIcon == null
                    ? const Center(child: Text('Select an icon', style: TextStyle(fontSize: 24)))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(_selectedIcon!, fit: BoxFit.cover),
                      ),
              ),
            ),

            const SizedBox(height: 30),

            // ====== EXPIRY DATE ======
            const Text('Expires', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickExpiryDate,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _expiryDate == null
                          ? 'Select expiry date'
                          : '${_expiryDate!.day}/${_expiryDate!.month}/${_expiryDate!.year}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Icon(Icons.calendar_today, color: Color.fromRGBO(34, 171, 82, 1)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ====== QUANTITY ======
            Row(
              children: [
                const Text('Quantity', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(width: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                      child: IconButton(
                        icon: const Icon(Icons.remove, color: Colors.white),
                        onPressed: _decrementQuantity,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(_addFoodQuantity.toString(), style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(34, 171, 82, 1),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: _incrementQuantity,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ====== ADD BUTTON ======
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled
                      ? const Color.fromRGBO(34, 171, 82, 1)
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: isButtonEnabled ? _handleAdd : null,
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
