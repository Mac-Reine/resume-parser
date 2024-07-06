import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _profileName = "Mallace Wanderian";
  String _email = "mallace@gmail.com";
  String _phone = "+123 456 7890";
  String _address = "123 Main Street, City, Country";

  File? _image;

  @override
  void initState() {
    super.initState();
    _nameController.text = _profileName;
    _emailController.text = _email;
    _phoneController.text = _phone;
    _addressController.text = _address;
  }

  void _updateProfile() {
    setState(() {
      _profileName = _nameController.text;
      _email = _emailController.text;
      _phone = _phoneController.text;
      _address = _addressController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated')),
    );
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // Adjust image quality as needed
    );
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xff1b81f1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: _getImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : AssetImage('assets/images/default_avatar.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: _getImage,
                        tooltip: 'Change Photo',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildEditableField(
                title: 'Profile Name',
                controller: _nameController,
              ),
              const SizedBox(height: 20),
              _buildEditableField(
                title: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              _buildEditableField(
                title: 'Phone',
                controller: _phoneController,
              ),
              const SizedBox(height: 20),
              _buildEditableField(
                title: 'Address',
                controller: _addressController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProfile,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff1b81f1)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(title),
          subtitle: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  enabled: true, // Enable editing
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
