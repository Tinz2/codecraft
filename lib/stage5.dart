import 'package:flutter/material.dart';

//Method หลักทีRun
void main() {
  runApp(Stage5());
}

//Class stateless สั่งแสดงผลหนาจอ
class Stage5 extends StatelessWidget {
  const Stage5({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: stage5(),
    );
  }
}

//Class stateful เรียกใช้การทํางานแบบโต้ตอบ
class stage5 extends StatefulWidget {
  @override
  State<stage5> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<stage5> {
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
