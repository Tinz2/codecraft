import 'package:flutter/material.dart';

//Method หลักทีRun
void main() {
  runApp(Editprofile());
}

//Class stateless สั่งแสดงผลหนาจอ
class Editprofile extends StatelessWidget {
  const Editprofile({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: editprofile(),
    );
  }
}

//Class stateful เรียกใช้การทํางานแบบโต้ตอบ
class editprofile extends StatefulWidget {
  @override
  State<editprofile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<editprofile> {
//ส่วนเขียน Code ภาษา dart เพื่อรับค่าจากหน้าจอมาคํานวณหรือมาทําบางอย่างและส่งค่ากลับไป
//ส่วนการออกแบบหน้าจอ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('………'),
      ),
      body: SingleChildScrollView(
//ส่วนการออกแบบหน้าจอ
          ),
    );
  }
}
