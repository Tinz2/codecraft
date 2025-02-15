import 'package:codecraft/profile_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  User? get currentUser => _auth.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      showSnackbar(context, 'เข้าสู่ระบบสำเร็จ');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, 'ไม่พบอีเมล์ของท่าน/ท่านกรอกอีเมล์ไม่ถูกต้อง');
      } else if (e.code == 'wrong-password') {
        showSnackbar(context, 'ท่านกรอกรหัสผ่านไม่ถูกต้อง');
      } else {
        showSnackbar(context, 'เกิดข้อผิดพลาด: ${e.message}');
      }
      return null;
    }
  }

  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      showSnackbar(context, 'ลงทะเบียนสำเร็จ');
      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, ProfileSetup.routeName);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'รหัสผ่านที่ระบุไม่ปลอดภัย');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'อีเมลนี้ถูกใช้งานไปแล้ว');
      } else {
        showSnackbar(context, 'เกิดข้อผิดพลาด: ${e.message}');
      }
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      showSnackbar(context, 'ออกจากระบบสำเร็จ');
    } catch (e) {
      showSnackbar(context, 'เกิดข้อผิดพลาดในการออกจากระบบ: $e');
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: email);
      print('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else {
        print('Something went wrong: $e');
      }
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
