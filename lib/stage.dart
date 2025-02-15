import 'package:flutter/material.dart';

void main() {
  runApp(const StageApp());
}

// แอปหลัก
class StageApp extends StatelessWidget {
  const StageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Stage(),
    );
  }
}

// รายละเอียดของแต่ละ Stage
final List<Map<String, String>> stages = [
  {"image": "assets/pt.jpg", "title": "STAGE 1", "description": "ผู้เล่นพบกับมอนสเตอร์ที่ถูกส่งออกมาเพื่อหยุดยั้งการเดินทางของ Code นักผจญภัย เมื่อสู้จนเอาชนะได้ รางวัลคือการได้เรียนรู้วิธีการใช้โค้ดที่ถูกต้องในการต่อสู้และพัฒนาทักษะ"},
  {"image": "assets/pt2.jpg", "title": "STAGE 2", "description": "นักเวทหญิงที่เชี่ยวชาญในศาสตร์โค้ดปรากฏตัว เธอเสนอให้ร่วมมือกันในการตามหาชิ้นส่วนของปีศาจ โดยใช้เวทมนตร์ที่เกี่ยวข้องกับการแก้ไขโค้ด"},
  {"image": "assets/pt3.jpg", "title": "STAGE 3", "description": "ในระหว่างทาง Code พบกับดาบที่สามารถใช้ผนึกปีศาจชิ้นแรกได้ หลังจากนั้นต้องต่อสู้กับมอนสเตอร์ที่เฝ้าผนึกชิ้นแรกเพื่อเอาชนะและเก็บดาบมาใช้ในการผนึก"},
  {"image": "assets/pt4.jpg", "title": "STAGE 4", "description": "Code จะต้องเผชิญหน้ากับมอนสเตอร์ 2 ตัวที่ขัดขวางการเดินทาง พวกมันรอคอยการทดสอบความสามารถของ Code ในการเขียนโค้ดและกลยุทธ์ในการเอาชนะ"},
  {"image": "assets/pt5.jpg", "title": "STAGE 5", "description": "พบกับคนป่าที่มีความสามารถพิเศษในป่าและการใช้เครื่องมือ เขาตัดสินใจเข้าร่วมกับ Code ในการตามหาชิ้นส่วนที่เหลือ และพวกเขาพบกับขวานที่ใช้ผนึกปีศาจชิ้นที่ 2 โดยมีมอนสเตอร์ไฟเฝ้าผนึก 3 ตัวอยู่"},
  {"image": "assets/pt6.jpg", "title": "STAGE 6", "description": "เป็นช่วงเวลาของการสะสมเหรียญเพื่อเพิ่มพลังและความสามารถให้กับ Code โดยต้องหาเหรียญที่ซ่อนอยู่ในพื้นที่"},
  {"image": "assets/pt7.jpg", "title": "STAGE 7", "description": "Code จะต้องต่อสู้กับมอนสเตอร์ต้นไม้ที่มีพลังจากธรรมชาติ การเอาชนะมันจะช่วยเสริมพลังของ Code และเปิดทางไปสู่การตามหาชิ้นส่วนของปีศาจที่เหลือ"},
  {"image": "assets/pt8.jpg", "title": "STAGE 8", "description": "พบหมวกเหล็กที่สามารถใช้ผนึกปีศาจชิ้นที่ 3 ได้ เมื่อ Code ต้องเผชิญกับมอนสเตอร์ที่เฝ้าผนึก 2 ตัว เขาจะต้องใช้ทั้งพลังของตัวเองและทักษะในการเขียนโค้ดเพื่อชนะ"},
  {"image": "assets/pt9.jpg", "title": "STAGE 9", "description": "อีกครั้งที่ Code ต้องเก็บเหรียญ 3 ชิ้น ซึ่งจะเพิ่มความแข็งแกร่งให้กับการต่อสู้ครั้งใหญ่ที่รออยู่"},
  {"image": "assets/pt10.jpg", "title": "STAGE 10", "description": "Code พบกับโล่ป้องกันที่ใช้ผนึกปีศาจชิ้นที่ 4 หลังจากที่เก็บรวบรวมไอเทมทั้ง 3 ชิ้นมาแล้ว (ดาบ, ขวาน, และหมวกเหล็ก) Code ต้องใช้ทั้ง 4 ไอเทมในการผนึกปีศาจที่ถูกปลดผนึกออกมาการเผชิญหน้ากับปีศาจที่ถูกปลดผนึกมีพลังมหาศาลและต้องผนึกปีศาจให้ได้ โดยการต่อสู้ครั้งนี้จะทดสอบทุกทักษะที่ Code ได้เรียนรู้ตลอดการเดินทาง"},
  {"image": "assets/pt11.jpg", "title": "STAGE 11", "description": "หลังจากการผนึกปีศาจสำเร็จ Code และนักเวทย์หญิงกลับมายังอาณาจักรและร่วมเฉลิมฉลองชัยชนะ การเดินทางและการผจญภัยที่พวกเขาผ่านมาด้วยกันนำไปสู่การสานสัมพันธ์อันแข็งแกร่ง ขณะที่ทุกคนรวมตัวกันเพื่อเฉลิมฉลอง พิธีวิวาห์ของ Code และนักเวทย์หญิงจึงเริ่มขึ้น ซึ่งถือเป็นการเริ่มต้นชีวิตใหม่หลังจากการต่อสู้ที่ยิ่งใหญ่!"},
];

// หน้า Stage
class Stage extends StatelessWidget {
  const Stage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo.png', // โลโก้ของแอป
                  height: screenHeight * 0.06,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Stage',
                  style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(
              'LogOut',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Stage',
              style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: stages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // รูปภาพของแต่ละ Stage
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            stages[index]["image"]!, // ดึงรูปของ Stage
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // ข้อความของแต่ละ Stage
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stages[index]["title"]!, // ดึงชื่อของ Stage
                                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                stages[index]["description"]!, // ดึงคำอธิบายของ Stage
                                style: const TextStyle(color: Colors.white70, fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Play', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
