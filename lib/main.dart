import 'package:flutter/material.dart';
import 'home.dart';
// import 'profile.dart';

void main() {
  // Entry point of the application
  runApp(RecipeApp());
}

// Main application widget
class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root of the widget tree
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // Hides the debug banner
      home: LoginScreen(), // Sets the initial screen to LoginScreen
    );
  }
}

// Login screen widget
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Key to uniquely identify the form
  final _formKey = GlobalKey<FormState>();

  // Controllers to manage input for username and password fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Hardcoded credentials for login
  static const String correctUsername = 'admin';
  static const String correctPassword = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // Prevents overflow on smaller screens
          child: Padding(
            padding: EdgeInsets.all(20.0), // Adds padding around the form
            child: Form(
              key: _formKey, // Associates the form with the key
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimizes the column size
                children: [
                  // Lock icon at the top
                  Icon(Icons.lock, size: 80, color: Colors.blue),
                  SizedBox(height: 20), // Adds spacing
                  // Username input field
                  TextFormField(
                    controller: usernameController, // Binds the controller
                    validator: (value) {
                      // Validates the input
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username', // Label for the field
                      border: OutlineInputBorder(), // Adds a border
                    ),
                  ),
                  SizedBox(height: 20), // Adds spacing
                  // Password input field
                  TextFormField(
                    controller: passwordController, // Binds the controller
                    obscureText: true, // Hides the input for security
                    validator: (value) {
                      // Validates the input
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password', // Label for the field
                      border: OutlineInputBorder(), // Adds a border
                    ),
                  ),
                  SizedBox(height: 20), // Adds spacing
                  // Row containing login and sign-up buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10), // Adds spacing
                      // Login button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _login(context), // Calls the login function
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Button color
                          ),
                          child: Text(
                            'Login To Enjoy Recipes', // Button text
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Adds spacing
                      // Sign-up button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Placeholder for sign-up action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // Button color
                          ),
                          child: Text(
                            'Sign Up', // Button text
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Adds spacing
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to handle login logic
  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Retrieves the input values
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      // Checks if the input matches the hardcoded credentials
      if (username == correctUsername && password == correctPassword) {
        // Displays a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful')),
        );
        // Navigates to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Displays an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }
}
