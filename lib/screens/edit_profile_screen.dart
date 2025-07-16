import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;
  final File? currentImage;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.mobile,
    this.currentImage,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController mobileCtrl;

  File? selectedImage;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.name);
    emailCtrl = TextEditingController(text: widget.email);
    mobileCtrl = TextEditingController(text: widget.mobile);
    selectedImage = widget.currentImage;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    mobileCtrl.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  void saveProfile() {
    Navigator.pop(context, {
      'name': nameCtrl.text.trim(),
      'email': emailCtrl.text.trim(),
      'mobile': mobileCtrl.text.trim(),
      'image': selectedImage,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile updated!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFF8BBD0),
                  backgroundImage: selectedImage != null ? FileImage(selectedImage!) : null,
                  child: selectedImage == null
                      ? Icon(Icons.person, size: 50, color: Color(0xFFA1356A))
                      : null,
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 16, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(labelText: 'Full Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: mobileCtrl,
            decoration: InputDecoration(labelText: 'Mobile Number'),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: emailCtrl,
            decoration: InputDecoration(labelText: 'Email Address'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: saveProfile,
            child: Text("Save"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              backgroundColor: Color(0xFFC74385),
            ),
          ),
        ],
      ),
    );
  }
}
