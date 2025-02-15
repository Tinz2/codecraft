import 'package:flutter/material.dart';
import 'auth.dart';
import 'menu.dart';
import 'sign_in.dart'; // เพิ่มการนำเข้า LoginPage

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  final AuthService _auth = AuthService();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut(context); // ส่ง context ไปยังฟังก์ชัน signOutเพื่อเรียกใช้ signout
              Navigator.pushReplacementNamed(context, LoginPage.routeName); // เพิ่มการนำทางไปยังหน้า LoginPage
            },
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'You are logged in!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}