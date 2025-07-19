import 'package:flutter/material.dart';

class AdminAccountsScreen extends StatefulWidget {
  const AdminAccountsScreen({super.key});

  @override
  State<AdminAccountsScreen> createState() => _AdminAccountsScreenState();
}

class _AdminAccountsScreenState extends State<AdminAccountsScreen> {
  List<Map<String, String>> accounts = [
    {'name': 'Dexter Navarro', 'email': 'dexter@gmail.com', 'password': 'admin123'},
    {'name': 'Marianne Lopez', 'email': 'marianne@example.com', 'password': 'marianne123'},
  ];

  void showEditDialog({Map<String, String>? account, int? index}) {
    final nameCtrl = TextEditingController(text: account?['name']);
    final emailCtrl = TextEditingController(text: account?['email']);
    final passwordCtrl = TextEditingController(text: account?['password']);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(account == null ? 'Add Admin Account' : 'Edit Admin Account'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA1356A)),
            onPressed: () {
              final newAccount = {
                'name': nameCtrl.text,
                'email': emailCtrl.text,
                'password': passwordCtrl.text,
              };
              setState(() {
                if (index == null) {
                  accounts.add(newAccount);
                } else {
                  accounts[index] = newAccount;
                }
              });
              Navigator.pop(context);
            },
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Account"),
        content: Text("Are you sure you want to delete ${accounts[index]['name']}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                accounts.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Accounts")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final acc = accounts[index];
          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFA1356A)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            title: Text(acc['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email: ${acc['email']}"),
                Text("Password: ${acc['password']}"),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFFA1356A)),
                  onPressed: () => showEditDialog(account: acc, index: index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => confirmDelete(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA1356A),
        onPressed: () => showEditDialog(),
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: 'Add Admin Account',
      ),
    );
  }
}
