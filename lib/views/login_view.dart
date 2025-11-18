import 'package:flutter/material.dart';
import 'home_view.dart';
import '../controllers/home_controller.dart';
import '../controllers/login_controller.dart';
import '../models/fridge.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            'Account',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sign in
            const Text(
              'Log in',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Create an account
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Or ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'create an account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Username label
            const Text(
              'Username:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Username input box
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'ex. HealthyEater3000',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintStyle: TextStyle(fontSize: 24, color: Colors.black54),
                ),
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Password label
            const Text(
              'Password:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Password input box
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'ex. Apple123',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintStyle: TextStyle(fontSize: 24, color: Colors.black54),
                ),
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),

            // Sign in button
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
                onPressed: () {
                  // Log In Functionality (Temporary Create User)
                  final loginController = LoginController();
                  final username = 'HealthyEater3000';
                  final password = 'Apple123';
                  loginController
                      .createUser(username, password)
                      // Create newUser given a username and password
                      .then((newUser) async {
                        // Create a fridge for the new user
                        final fridge = await Fridge.createAndInsert(newUser);
                        // Navigate to home view
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeWrapper(
                              homeController: HomeController(
                                user: newUser,
                                fridge: fridge,
                              ),
                            ),
                          ),
                        );
                      })
                      .catchError((error) {
                        // Show error message if user creation fails
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to create account: $error'),
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              17,
                              0,
                            ),
                          ),
                        );
                      });
                },
                child: const Text(
                  'Sign in',
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
