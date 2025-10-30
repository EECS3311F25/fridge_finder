import 'package:flutter/material.dart';

class FoodItemView extends StatelessWidget {
  const FoodItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Item')),
      body: const Center(child: Text('Food Item')),
    );
  }
}
