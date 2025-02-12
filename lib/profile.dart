import 'package:flutter/material.dart';
import 'menu.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('Welcome to the Profile Page!'),
      ),
      bottomNavigationBar: MenuPage(),
    );
  }
}