import 'package:flutter/material.dart';
import 'menu.dart';

class Stage extends StatelessWidget {
  static const String routeName = '/stage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stage Page'),
      ),
      body: Center(
        child: Text('Welcome to the Stage Page!'),
      ),
      bottomNavigationBar: MenuPage(),
    );
  }
}