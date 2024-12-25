import 'package:flutter/material.dart';
import 'package:book_grocer/common/color_extenstion.dart';
import 'package:share_plus/share_plus.dart'; // For sharing app
import '../privacy/privacy_page.dart';
import '../Terms/TermsPage.dart';
import '../account/account_view.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false; // Dark mode state

  @override
  void initState() {
    super.initState();
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value; // Update the dark mode state
    });
  }

  void _shareApp() {
    Share.share('Check out our amazing app: https://example.com'); // Add your app link
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, '/login'); // Redirect to login page
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dark Mode Toggle
            ListTile(
              leading: Icon(Icons.brightness_6, color: TColor.subTitle),
              title: Text("Dark Mode", style: TextStyle(color: TColor.text)),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  _toggleDarkMode(value);
                },
                activeColor: TColor.primary,
              ),
            ),
            const Divider(),

            // Terms and Conditions
            ListTile(
              leading: Icon(Icons.description, color: TColor.subTitle),
              title: Text("Terms and Conditions", style: TextStyle(color: TColor.text)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsPage()),
                );
              },
            ),
            const Divider(),

            // Privacy Policy
            ListTile(
              leading: Icon(Icons.lock, color: TColor.subTitle),
              title: Text("Privacy Policy", style: TextStyle(color: TColor.text)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPage()),
                );
              },
            ),
            const Divider(),

            // Account Settings
            ListTile(
              leading: Icon(Icons.account_circle, color: TColor.subTitle),
              title: Text("Account Settings", style: TextStyle(color: TColor.text)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountView()),
                );
              },
            ),
            const Divider(),

            // Share App
            ListTile(
              leading: Icon(Icons.share, color: TColor.subTitle),
              title: Text("Share App", style: TextStyle(color: TColor.text)),
              onTap: _shareApp, // Share the app
            ),
            const Divider(),

            // Logout
            ListTile(
              leading: Icon(Icons.logout, color: TColor.subTitle),
              title: Text("Logout", style: TextStyle(color: TColor.text)),
              onTap: _logout, // Logout the user
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
