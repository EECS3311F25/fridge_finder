import 'package:flutter/material.dart';
import 'home_view.dart';
import 'register_view.dart';
import '../controllers/home_controller.dart';
import '../controllers/login_controller.dart';
import '../models/fridge.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
        child: SingleChildScrollView(
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

              // Create an account link
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterView()),
                  );
                },
                child: RichText(
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
                  onPressed: () async {
                  final loginController = LoginController();
                  final username = usernameController.text;
                  final password = passwordController.text;

                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(34, 171, 82, 1),
                        ),
                      );
                    },
                  );

                  try {
                    // Attempt login
                    final user = await loginController.login(username, password);
                    
                    // Get or create fridge for the user
                    Fridge? fridge = await Fridge.getFridgeByUser(user);
                    
                    // If no fridge exists, create one
                    if (fridge == null) {
                      fridge = await Fridge.createAndInsert(user);
                    }
                    
                    // Close loading dialog
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      
                      // Navigate to home view
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeWrapper(
                            homeController: HomeController(
                              user: user,
                              fridge: fridge!,
                            ),
                          ),
                        ),
                      );
                    }
                  } catch (error) {
                    // Close loading dialog
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login failed: $error'),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  }
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
    ),
    );
  }
}
