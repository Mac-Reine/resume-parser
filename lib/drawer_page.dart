import 'package:flutter/material.dart';
import 'getresult.dart'; // Import GetResult screen

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
      color: Color(0xff1b81f1),
      padding: EdgeInsets.only(top: 15, bottom: 8, left: 12, right: 12),
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
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 40,
        child: Icon(Icons.person),
      ),
    );
  }

  Widget accountName() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
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
    return ListTile(
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
        tile(title: "My Profile", icon: Icons.account_circle, onTap: () {}),
        tile(title: "Account Settings", icon: Icons.settings, onTap: () {}),
        tile(title: "Upload Resume", icon: Icons.upload, onTap: () => _showBottomSheet(context)),
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      backgroundColor: Colors.black,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Select Files'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.push( // Navigate to GetResult screen
                    context,
                    MaterialPageRoute(builder: (context) => const GetResult()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Get Results'),
              ),
            ],
          ),
        );
      },
    );
  }
}
