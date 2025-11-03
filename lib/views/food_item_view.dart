import 'package:flutter/material.dart';

class FoodItemView extends StatelessWidget {
    final String foodName;

  const FoodItemView({super.key, required this.foodName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Item')),
      body: const Center(child: Text('Food Item')),
    );
  }
}
