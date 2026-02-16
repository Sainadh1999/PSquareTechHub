import 'package:flutter/material.dart';

// Constants to avoid magic values
const double defaultPadding = 16.0;
const double fieldSpacing = 16.0;
const double buttonSpacing = 24.0;

// Hardcoded valid email (Day-1 demo)
const String validEmail = 'admin@psquare.com';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P Square Tech Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: fieldSpacing),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: buttonSpacing),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: validateLogin,
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackBar(
        message: 'Email and Password must not be empty',
        isSuccess: false,
      );
    } else if (email != validEmail) {
      showSnackBar(
        message: 'Invalid email address',
        isSuccess: false,
      );
    } else {
      showSnackBar(
        message: 'Login Successful',
        isSuccess: true,
      );
    }
  }

  void showSnackBar({
    required String message,
    required bool isSuccess,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}
