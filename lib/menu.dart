import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile.dart';
import 'stage.dart';
import 'archivement.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu';
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    Stage(),
    Archivement(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ตั้งค่าสีพื้นหลังของ Scaffold เป็นสีดำ
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // ตั้งค่าสีพื้นหลังของ BottomNavigationBar เป็นสีดำ
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue.shade300, // ตั้งค่าสีของไอเท็มที่ถูกเลือก
        unselectedItemColor: Colors.white, // ตั้งค่าสีของไอเท็มที่ไม่ได้ถูกเลือก
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Stage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Archivement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}