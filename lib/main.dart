import 'package:codecraft/auth.dart';
import 'package:codecraft/home_page.dart';
import 'package:codecraft/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Method หลักทีRun
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options:FirebaseOptions(
            apiKey: "AIzaSyB0z8xhXx6caKxTsgyPBa7EO9xQNs52NA0",
            authDomain: "codecraft-8a4b3.firebaseapp.com",
            projectId: "codecraft-8a4b3",
            storageBucket: "codecraft-8a4b3.firebasestorage.app",
            messagingSenderId: "576950379097",
            appId: "1:576950379097:web:05b756a658efd8026f0748",
            measurementId: "G-3YHW1F9D9T"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

// Class MyApp ส าหรับการแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
  MyApp({super.key});
// ตรวจสอบ AuthService
  final AuthService _auth = AuthService();
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
        stream: _auth.authStateChanges, // ตรวจสอบการเชื่อมต่อ Stream
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return HomePage(); // ตรวจสอบว่ามี HomePage และท างานได้
          } else {
            return const LoginPage(); // ตรวจสอบว่ามี LoginPage และท างานได้
          }
        },
      ),
     routes: {
        LoginPage.routeName: (BuildContext context) => const LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
      },
    );
  }
}