import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(222, 222, 222, 1),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.white,
            child: Column(
              //Wrap at minimum size (stop at bottom of search)
              mainAxisSize: MainAxisSize.min,
              //Children contains Title 'Fridge Finder' and 'Search'
              children: [
                // Title for main menu
                Text(
                  'Fridge Finder',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                // Search Text
                Text(
                  'Search',
                  style: TextStyle(
                    color: Color.fromARGB(255, 30, 30, 30),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
