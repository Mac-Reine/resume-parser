import 'package:flutter/material.dart';
import 'upload_resume_page.dart';
import 'settings.dart';
import 'profile_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          userAccountDrawerHeader(),
          Expanded(child: tilesBuilder()),
        ],
      ),
    );
  }

  Widget userAccountDrawerHeader() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: const Color(0xff1b81f1),
      padding: const EdgeInsets.only(top: 15, bottom: 8, left: 12, right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          avatar(),
          accountName(),
          accountEmail(),
        ],
      ),
    );
  }

  Widget avatar() {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const CircleAvatar(
        radius: 40,
        child: Icon(Icons.person),
      ),
    );
  }

  Widget accountName() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Text(
        "Mallace Wanderian",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget accountEmail() {
    return const ListTile(
      contentPadding: EdgeInsets.only(left: 8),
      title: Text(
        "Software Developing Company",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "mallace@gmail.com",
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget tilesBuilder() {
    return ListView(
      shrinkWrap: true,
      children: [
        tile(title: "My Profile", icon: Icons.account_circle, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        }),
        tile(title: "Account Settings", icon: Icons.settings, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        }),
        tile(title: "Upload Resume", icon: Icons.upload, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UploadResumePage()),
          );
        }),
        tile(title: "Logout", icon: Icons.logout, onTap: () {}),
      ],
    );
  }

  Widget tile({required String title, required IconData icon, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}