import 'package:flutter/material.dart';

class BranchSelectorScreen extends StatelessWidget {
  final List<String> branches = [
    "Libjo",
    "Banaba East",
    "Bolbok",
    "Cuta Dagatan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Branch")),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: branches.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final branch = branches[index];
          return ListTile(
            leading: const Icon(Icons.store, color: Color(0xFFA1356A)),
            title: Text(branch),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/home',
                arguments: {'branch': branch},
              );
            },
          );
        },
      ),
    );
  }
}
