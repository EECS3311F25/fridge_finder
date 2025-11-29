import 'package:flutter/material.dart';
import 'home_view.dart';
import 'login_view.dart';
import '../controllers/home_controller.dart';
import '../controllers/register_controller.dart';
import '../models/fridge.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

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
            // Create Account Title
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Already have an account link
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
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
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'ex. HealthyEater3000',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintStyle: TextStyle(fontSize: 24, color: Colors.black54),
                ),
                style: const TextStyle(fontSize: 24, color: Colors.black),
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
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'ex. Apple123',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintStyle: TextStyle(fontSize: 24, color: Colors.black54),
                ),
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),

            // Sign up button
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
                  final registerController = RegisterController();
                  final username = usernameController.text;
                  final password = passwordController.text;

                  registerController
                      .createUser(username, password)
                      .then((newUser) async {
                        // Create a fridge for the new user
                        final fridge = await Fridge.createAndInsert(newUser);
                        // Navigate to home view
                        if (context.mounted) {
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
                        }
                      })
                      .catchError((error) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to create account: $error'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      });
                },
                child: const Text(
                  'Sign up',
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
