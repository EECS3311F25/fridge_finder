import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // home_view.dart is the main screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
