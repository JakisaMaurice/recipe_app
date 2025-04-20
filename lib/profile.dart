import 'package:flutter/material.dart';
import 'home.dart'; // Importing the HomePage widget
import 'main.dart'; // Importing the LoginScreen widget to access the username

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Retrieve the username from the LoginScreen class
  final String username = LoginScreen.correctUsername ?? 'Guest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context); // Navigate back to the previous screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // Navigate to the HomePage
          },
        ),
        backgroundColor: Colors.orange[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, color: Colors.orange[800], size: 60),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Username:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(username, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('$username@mail.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add logout functionality here
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[800],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('Logout', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
