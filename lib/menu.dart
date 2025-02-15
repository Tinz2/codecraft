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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFF00008B), // น้ำเงินเข้ม
              Color(0xFF87CEFA), // ฟ้าอ่อน
            ],
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 81, 255, 1), // น้ำเงินเข้ม
              Color.fromRGBO(56, 119, 255, 1), // ฟ้าอ่อน
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
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
          type: BottomNavigationBarType.fixed,
          
          backgroundColor: const Color.fromARGB(0, 255, 255, 255), // ใช้ transparent เพื่อให้แสดง gradient
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
