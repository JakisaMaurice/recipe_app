import 'package:flutter/material.dart';
import 'package:recipe_book_app/home.dart';

// This is the SettingsPage widget, which represents the settings screen of the app.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar at the top of the screen with a title and a back button.
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the HomePage when the back button is pressed.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        
        backgroundColor: Colors.orange[800], // Set the AppBar background color.
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // Add padding around the body content.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start.
          children: [
            // Title for the settings screen.
            Text('Settings', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20), // Add vertical spacing.

            // ListTile for "Change Password" option.
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios), // Add a forward arrow icon.
              onTap: () {
                // Handle change password action (to be implemented).
              },
            ),
            Divider(), // Add a horizontal divider.

            // ListTile for "Notifications" option with a switch.
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: true, // Initial value of the switch.
                onChanged: (value) {
                  // Handle switch toggle (to be implemented).
                },
              ),
            ),
            Divider(), // Add a horizontal divider.

            // ListTile for "Privacy Policy" option.
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios), // Add a forward arrow icon.
              onTap: () {
                // Handle privacy policy action (to be implemented).
              },
            ),
            Divider(), // Add a horizontal divider.

            // ListTile for "Theme Mode" option with a dropdown menu.
            ListTile(
              title: Text('Theme Mode'),
              trailing: DropdownButton<ThemeMode>(
                value: ThemeMode.system, // Default value for the dropdown.
                items: [
                  // Dropdown menu items for different theme modes.
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System Default'),
                  ),
                ],
                onChanged: (ThemeMode? newMode) {
                  // Handle theme mode change (to be implemented).
                  // You can use a state management solution to update the theme.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
