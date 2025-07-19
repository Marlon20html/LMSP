import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy and Policy")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("This is our privacy policy..."),
      ),
    );
  }
}
