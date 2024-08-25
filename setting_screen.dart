import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(105, 146, 58, 184),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2B2E4A), Color(0xFF1B1D2F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.brightness_6, color: Colors.white),
              title: const Text('Theme', style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Choose light or dark mode',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Handle theme selection
                _showThemeSelectionDialog(context);
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white),
              title: const Text('Notifications',
                  style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Manage notification settings',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Handle notification settings
                _showNotificationSettingsDialog(context);
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.white),
              title:
                  const Text('Privacy', style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Privacy and security options',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Navigate to privacy settings
                _navigateToPrivacySettings(context);
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.white),
              title:
                  const Text('Account', style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Manage your account',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Navigate to account management screen
                _navigateToAccountSettings(context);
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.white),
              title: const Text('Help & Support',
                  style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Get help or provide feedback',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Navigate to help and support screen
                _navigateToHelpSupport(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Light Theme'),
                onTap: () {
                  // Handle light theme selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Dark Theme'),
                onTap: () {
                  // Handle dark theme selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('System Default'),
                onTap: () {
                  // Handle system default theme selection
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotificationSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Notification Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                title: const Text('Enable Notifications'),
                value: true, // Add logic to manage notification toggle
                onChanged: (bool value) {
                  // Handle notification enable/disable
                },
              ),
              SwitchListTile(
                title: const Text('Receive Meeting Reminders'),
                value: true, // Add logic for meeting reminders
                onChanged: (bool value) {
                  // Handle meeting reminder toggle
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToPrivacySettings(BuildContext context) {
    // Navigate to the privacy settings screen
  }

  void _navigateToAccountSettings(BuildContext context) {
    // Navigate to the account management screen
  }

  void _navigateToHelpSupport(BuildContext context) {
    // Navigate to the help and support screen
  }
}
