import 'package:codecraft/auth.dart';
import 'package:codecraft/home_page.dart';
import 'package:codecraft/sign_in.dart';
import 'package:codecraft/profile_setup.dart'; // เพิ่มการนำเข้า ProfileSetup
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB0z8xhXx6caKxTsgyPBa7EO9xQNs52NA0",
            authDomain: "codecraft-8a4b3.firebaseapp.com",
            projectId: "codecraft-8a4b3",
            storageBucket: "codecraft-8a4b3.appspot.com",
            messagingSenderId: "576950379097",
            appId: "1:576950379097:web:05b756a658efd8026f0748",
            measurementId: "G-3YHW1F9D9T"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(ProfileSetup());
}

class ProfileSetup extends StatelessWidget {
  ProfileSetup({super.key});
  final AuthService _auth = AuthService();
  
  static var routeName = '/profile_setup'; // เพิ่มตัวแปรเส้นทางสำหรับ ProfileSetup

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      home: StreamBuilder(
        stream: _auth.authStateChanges,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const SignInScreen();
          }
        },
      ),
      routes: {
        SignInScreen.routeName: (BuildContext context) => const SignInScreen(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        MenuPage.routeName: (BuildContext context) => MenuPage(),
        ProfileSetup.routeName: (BuildContext context) => ProfileSetup(), // เพิ่มเส้นทางสำหรับ ProfileSetup
      },
    );
  }
}