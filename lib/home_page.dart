import 'package:flutter/material.dart';
import 'drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      drawer: const DrawerPage(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1.0,
            color: Colors.grey,
          ),
          BottomNavigationBar(
            backgroundColor: Colors.cyan,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feedback),
                label: 'Feedback',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_answer),
                label: 'F&Q',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black54,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Resume Parser'),
    );
  }

  Widget body() {
    return Center(
      child: Image.asset('assets/images/applogo.png'),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
