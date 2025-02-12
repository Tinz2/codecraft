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
    Profile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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