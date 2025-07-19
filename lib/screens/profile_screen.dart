import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Name Here";
  String mobile = "+63 999 999 9999";
  String email = "youremail@example.com";
  File? profileImage;

  final List<Map<String, dynamic>> options = [
    {
      'icon': Icons.history,
      'title': "Transaction History",
      'route': '/transaction_history'
    },
    {
      'icon': Icons.help,
      'title': "Help and Support",
      'route': '/help_support'
    },
    {
      'icon': Icons.description,
      'title': "Terms and Conditions",
      'route': '/terms'
    },
    {
      'icon': Icons.privacy_tip,
      'title': "Privacy and Policy",
      'route': '/privacy'
    },
    {
      'icon': Icons.star_rate,
      'title': "Rate Our Services",
      'route': '/rate'
    },
  ];

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFF2DC),
        title: const Text("Logout", style: TextStyle(color: Color(0xFFA1356A))),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA1356A),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void goToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditProfileScreen(
          name: name,
          email: email,
          mobile: mobile,
          currentImage: profileImage,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        name = result['name'];
        email = result['email'];
        mobile = result['mobile'];
        profileImage = result['image'];
      });
    }
  }

  void onOptionTap(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: const Color(0xFFF8BBD0),
                backgroundImage:
                    profileImage != null ? FileImage(profileImage!) : null,
                child: profileImage == null
                    ? const Icon(Icons.person, size: 50, color: Color(0xFFA1356A))
                    : null,
              ),
              const SizedBox(height: 12),
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text(mobile),
              Text(email),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: goToEditProfile,
                icon: const Icon(Icons.edit, color: Colors.grey),
                label: const Text("Edit Profile"),
              ),
            ],
          ),
          const Divider(),
          ...options.map((item) {
            return ListTile(
              leading: Icon(item['icon'], color: const Color(0xFFA1356A)),
              title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => onOptionTap(item['route']),
            );
          }).toList(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () => showLogoutDialog(context),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 4),
    );
  }
}
