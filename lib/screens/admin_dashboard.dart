import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.local_laundry_service, color: Colors.pink),
            title: Text("Manage Services"),
            onTap: () => Navigator.pushNamed(context, '/admin-services'),
          ),
          ListTile(
            leading: Icon(Icons.list_alt, color: Colors.pink),
            title: Text("View Orders"),
            onTap: () => Navigator.pushNamed(context, '/admin-orders'),
          ),
          ListTile(
            leading: Icon(Icons.price_change, color: Colors.pink),
            title: Text("Manage Prices"),
            onTap: () => Navigator.pushNamed(context, '/admin-prices'),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.pink),
            title: Text("Reports by Branch"),
            onTap: () => Navigator.pushNamed(context, '/admin-reports'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.pink),
            title: Text("Admin Accounts"),
            onTap: () => Navigator.pushNamed(context, '/admin-accounts'),
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.pink),
            title: Text("Customer Feedback"),
            onTap: () => Navigator.pushNamed(context, '/admin-feedback'),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
          ),
        ],
      ),
    );
  }
}
