import 'package:flutter/material.dart';
import 'main.dart';
import 'profile.dart';
import 'settings.dart';

// HomePage is the main screen of the app, displaying recipes and navigation options
class HomePage extends StatelessWidget {
  HomePage({super.key});
  static bool isFirstTime = true; // Tracks if the user is visiting for the first time

  final String username = LoginScreen.correctUsername; // Username from the login screen

  // List of recipe items with their images and titles
  final List<Map<String, String>> items = [
    {'image': 'assets/Chicken_Nuggets.png', 'title': 'Crispy Chicken Nuggets'},
    {
      'image': 'assets/chocolate-indulgence.png',
      'title': 'Chocolate Indulgence',
    },
    {
      'image': 'assets/crispy-comte-cheeseburgers.png',
      'title': 'Crispy Comte Cheeseburgers',
    },
    {'image': 'assets/fries_recipe.png', 'title': 'Fries'},
    {'image': 'assets/Pizza-Rolls-Recipe.png', 'title': 'Pizza Rolls'},
    {'image': 'assets/secret-burger-sauce.png', 'title': 'Secret Burger Sauce'},
    {
      'image': 'assets/chocolate-indulgence.png',
      'title': 'Chocolate Indulgence',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Show a welcome popup only the first time the user visits the page
    if (isFirstTime) {
      isFirstTime = false; // Ensure the popup is only shown once
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false, // Prevent user from dismissing early
          builder: (context) => AlertDialog(
            title: Text('Welcome!'),
            content: Text(
              'Hello, $username 👋',
              style: TextStyle(fontSize: 25),
            ),
          ),
        );

        // Auto close the dialog after 2 seconds
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(); // Close the dialog
        });
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recipe App',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.orange[800], // Set the app bar color
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer header with user information
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.orange[800]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.orange[800],
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$username',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '$username@mail.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              // Navigation options in the drawer
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {}, // Stay on the home page
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  ); // Navigate to the profile page
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  ); // Navigate to the settings page
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ); // Navigate to the login screen
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Section for latest recipes
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Latest Recipes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // Horizontal scrollable list of recipe items
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Recipe image
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: Image.network(
                                item['image']!,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Recipe title
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item['title']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              // Section for popular recipes
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Popular Recipes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // List of popular recipes
              ListTile(
                title: Text('Regular Chicken Nuggets'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Chicken Nuggets with Cheese'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Egg and cheese sandwich'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Bacon'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Home made fries'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Guacamole'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Jalapeno poppers'),
                onTap: () {}, // Action for this recipe
              ),
              ListTile(
                title: Text('Buffalo wings'),
                onTap: () {}, // Action for this recipe
              ),
            ],
          ),
        ),
      ),
    );
  }
}
