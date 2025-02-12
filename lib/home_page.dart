import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home'; // กำหนด route ของหน้า Home
  final AuthService _auth = AuthService(); // สร้าง instance ของ AuthService

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // กำหนดสีพื้นหลังของ AppBar เป็นสีดำ
        title: Row(
          mainAxisSize: MainAxisSize.min, // ป้องกันไม่ให้ Row ขยายเต็มพื้นที่
          children: [
            //อันนี้คือ คำสั่งเพิ่มรูป
            //ที่อยู่ของภาพ//Image.asset(
            //'assets/logo.png', // ใส่ path ของรูปภาพที่ต้องการใช้
            //height: 30, // ปรับขนาดรูป
            //),
            SizedBox(width: 8), // เว้นระยะห่างระหว่างรูปกับข้อความ
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blue, Colors.purple], // ไล่เฉดสีของข้อความ
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'CodeCraft',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // ใช้สีขาวเพื่อให้ ShaderMask ใช้งานได้
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black, // สีพื้นหลังของปุ่ม
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
              onPressed: () async {
                await _auth.signOut(context); // ออกจากระบบเมื่อกดปุ่ม
              },
              child: Text(
                'Login/Register',
                style: TextStyle(
                    color: Colors.white, // สีฟ้อนเป็นสีขาว
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // จัดเรียงเนื้อหาให้อยู่ตรงกลาง
        children: [
          SizedBox(height: 20), // กำหนดช่องว่าง
          // ข้อความหัวข้อหลัก
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Learn Code By\n',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: 'Playing ',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: 'Games',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          // คำอธิบายเนื้อหา
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // ระยะห่างซ้ายขวา
            child: Text(
              'Learning to code is no longer a dull experience with ITINs. '
              'We transform the learning process into an engaging and interactive experience, '
              'making it as fun and exciting as playing a game.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: 10),
          // ปุ่ม "Play and Learn Code"
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight), // ไล่สี
              borderRadius: BorderRadius.circular(20), // มุมโค้งมน
            ),
            child: SizedBox(
              width: 250, // ปุ่มกว้างเต็มจอ
              height: 50, // กำหนดความสูง 50
              child: ElevatedButton(
                onPressed: () {}, // กำหนดฟังก์ชันเมื่อกดปุ่ม
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .transparent, // ให้ปุ่มเป็นสีโปร่งใส เพื่อให้เห็น Gradient
                  shadowColor: Colors.transparent, // เอาเงาออก
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'Play and Learn Code',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // พื้นที่เล่นเกม (ตัวอย่าง)
          Padding(
            padding: EdgeInsets.all(15), // เพิ่ม padding ทุกด้าน 10
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.green[800], // สีพื้นหลังของเกม
              child: Center(
                child: Text(
                  'พื้นที่วางเกมส์กับตัวละคร (รอวางเกม)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // ช่องใส่โค้ด
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 117, 117, 117), // พื้นหลังสีดำ
              borderRadius: BorderRadius.circular(10), // ขอบมน
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontFamily: 'monospace', fontSize: 16),
                    children: [
                      TextSpan(
                          text: '1 ', style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: 'display',
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 17,
                          )),
                      TextSpan(
                          text: ': flex;\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                      TextSpan(
                          text: '2 ', style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: 'justify-content',
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 17,
                          )),
                      TextSpan(
                          text: ': center;',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                    ],
                  ),
                ),
                // ช่องให้ผู้ใช้กรอกโค้ด
                Row(
                  children: [
                    Text('3 ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'monospace',
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(
                                221, 170, 163, 163), // เปลี่ยนเป็นสีเทาอ่อนขึ้น
                            borderRadius:
                                BorderRadius.circular(10)), // กล่องสีเทาเข้ม
                        child: TextField(
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'monospace'), // ฟอนต์ monospace
                          decoration: InputDecoration(
                              border: InputBorder.none), // เอาเส้นขอบออก
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // ปุ่ม "Check Answer"
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight), // ไล่สี
              borderRadius: BorderRadius.circular(20), // มุมโค้งมน
            ),
            child: ElevatedButton(
              onPressed: () {}, // ฟังก์ชันเมื่อกดปุ่ม
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // โปร่งใส
                shadowColor: Colors.transparent, // ไม่มีเงา
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: SizedBox(
                width: 150, // ปุ่มกว้าง 150
                height: 50, // กำหนดความสูง 50
                child: ElevatedButton(
                  onPressed: () {}, // กำหนดฟังก์ชันเมื่อกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // ให้ปุ่มเป็นสีโปร่งใส เพื่อให้เห็น Gradient
                    shadowColor: Colors.transparent, // เอาเงาออก
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    'Check Answer',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0), // เปลี่ยนพื้นหลังเป็นสีดำ
      // แถบเมนูด้านล่าง ********อันนี้กูปิดเป็นคอมเม้นไว้นะ แถบเมณูด้านล่าง********
      //bottomNavigationBar: Container(
      //decoration: BoxDecoration(
      //gradient: LinearGradient(
      //colors: [Colors.blue.shade900, Colors.blue.shade400],
      //begin: Alignment.centerLeft,
      //end: Alignment.centerRight), // ไล่สี
      //borderRadius:
      //BorderRadius.vertical(top: Radius.circular(20)), // มุมโค้งด้านบน
      //),
      //padding: EdgeInsets.symmetric(vertical: 15), // ระยะห่างของเมนู
      //child: Row(
      //mainAxisAlignment:
      //MainAxisAlignment.spaceEvenly, // จัดเรียงปุ่มให้ห่างเท่ากัน
      //children: [
      //Text("Home",
      //style: TextStyle(
      //color: Colors.white,
      //fontWeight: FontWeight.bold,
      //fontSize: 16)),
      //Text("Games",
      //style: TextStyle(
      //color: Colors.white,
      //fontWeight: FontWeight.bold,
      //fontSize: 16)),
      //Text("Achievement",
      //style: TextStyle(
      //color: Colors.white,
      //fontWeight: FontWeight.bold,
      //fontSize: 16)),
      //Text("Profile",
      //style: TextStyle(
      //color: Colors.white,
      //fontWeight: FontWeight.bold,
      //fontSize: 16)),
      //],
      // ),
      //),
    );
  }
}
