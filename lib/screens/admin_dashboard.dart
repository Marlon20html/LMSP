import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFFFFF2DC),
        title: Text("Logout", style: TextStyle(color: Color(0xFFA1356A))),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFA1356A),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => showLogoutDialog(context),
          icon: Icon(Icons.logout),
          label: Text("Logout"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            backgroundColor: Color(0xFFA1356A),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
