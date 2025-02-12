import 'package:flutter/material.dart';
import 'menu.dart';

class Archivement extends StatelessWidget {
  static const String routeName = '/archivement';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archivement Page'),
      ),
      body: Center(
        child: Text('Welcome to the Archivement Page!'),
      ),
      bottomNavigationBar: MenuPage(),
    );
  }
}