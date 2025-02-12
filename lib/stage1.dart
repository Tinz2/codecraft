import 'package:flutter/material.dart';

void main() {
  runApp(Stage1());
}

class Stage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Stage1Screen(),
    );
  }
}

class Stage1Screen extends StatefulWidget {
  @override
  _Stage1ScreenState createState() => _Stage1ScreenState();
}

class _Stage1ScreenState extends State<Stage1Screen> {
  TextEditingController _answerController = TextEditingController();

  void _checkAnswer() {
    // เช็คคำตอบที่ผู้ใช้กรอก
    if (_answerController.text.trim() ==
        "display: flex; justify-content: center;") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Correct! Moving to Stage 2...")));
      // ไปยังหน้าถัดไป (Stage 2)
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Try again!")));
    }
  }

  // ฟังก์ชันสำหรับการ Logout
  void _logout() {
    // คุณสามารถเพิ่มการดำเนินการเมื่อผู้ใช้คลิกปุ่ม Logout ที่นี่
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Logging out...")));
    // ตัวอย่างการออกจากแอพหรือไปยังหน้าหลักอื่นๆ
    // Navigator.pop(context); // หรือไปหน้าอื่นที่ต้องการ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // ลบเงาออกจาก AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // จัดตำแหน่งให้ทั้งสองปุ่มกระจายไปทางซ้ายและขวา
          children: [
            // ปุ่มย้อนกลับ (IconButton) อยู่ทางซ้าย
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // ฟังก์ชันย้อนกลับ
              },
            ),
            // ปุ่ม Logout (TextButton) อยู่ทางขวา
            TextButton(
              onPressed: _logout, // เมื่อคลิกปุ่มนี้จะเรียกใช้ฟังก์ชัน _logout
              child: Text(
                'Logout', // ข้อความของปุ่ม Logout
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // ข้อความ "Stage 1" ที่มีการไล่สี
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 36, 152, 247),
                    const Color.fromARGB(255, 0, 94, 255)
                  ], // ไล่สีฟ้าไปน้ำเงิน
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                'Stage 1',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // ให้สีของข้อความเป็นสีขาว
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Hello, here is a task for you...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // ใช้ Stack เพื่อวางรูปต่างๆ ซ้อนกัน
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // ภาพพื้นหลัง (หญ้า)
                  Positioned.fill(
                    child: Image.asset(
                      'assets/grass.jpg', // แทนที่ด้วยไฟล์หญ้า
                      fit: BoxFit.cover,
                    ),
                  ),
                  // ตัวละครที่อยู่บนหญ้า
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Image.asset(
                      'assets/character.png', // แทนที่ด้วยไฟล์ตัวละคร
                      width: 100,
                      height: 100,
                    ),
                  ),
                  // ผลไม้ที่อยู่บนหญ้า
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Image.asset(
                      'assets/fruits.png', // แทนที่ด้วยไฟล์ผลไม้
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Here\'s a CSS code editor below:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Custom Editor with Line Numbers
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // บรรทัดที่ 1
                  Row(
                    children: [
                      Text('1', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 4), // ลดระยะห่างเล็กน้อย
                      Expanded(
                        child: Text(
                          "display: flex;",
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // บรรทัดที่ 2
                  Row(
                    children: [
                      Text('2', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 4), // ลดระยะห่างเล็กน้อย
                      Expanded(
                        child: Text(
                          "justify-content: center;",
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // บรรทัดที่ 3
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0), // ลดระยะห่างระหว่างบรรทัดที่ 2 และ 3
                    child: Row(
                      children: [
                        Text('3', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 4), // ลดระยะห่างเล็กน้อย
                        Expanded(
                          child: TextField(
                            controller: _answerController,
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 1, // ใช้บรรทัดเดียวสำหรับกรอก
                            decoration: InputDecoration(
                              hintText: 'Type your code here...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // ปุ่ม Check Answer
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0), // กำหนดเป็น 0 เพื่อให้มุมเหลี่ยมมากขึ้น
                  ),
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.transparent),
                  shadowColor: Colors.transparent,
                ),
                onPressed: _checkAnswer,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // กำหนดเป็น 0 เพื่อให้มุมเหลี่ยมมากขึ้น
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 36, 152, 247),
                        const Color.fromARGB(255, 0, 94, 255)
                      ], // ไล่สีฟ้าไปน้ำเงิน
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  child: Text("Check Answer",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
