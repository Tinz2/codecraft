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
  {"image": "assets/pt.jpg", "title": "Stage 1", "description": "บทที่1"},
  {"image": "assets/pt2.jpg", "title": "Stage 2", "description": "บทที่2"},
  {"image": "assets/pt3.jpeg", "title": "Stage 3", "description": "บทที่3"},
  {"image": "assets/pt4.jpg", "title": "Stage 4", "description": "บทที่4"},
  {"image": "assets/pt5.jpg", "title": "Stage 5", "description": "บทที่5"},
  {"image": "assets/pt6.jpg", "title": "Stage 6", "description": "บทที่6"},
  {"image": "assets/pt7.jpg", "title": "Stage 7", "description": "บทที่7"},
  {"image": "assets/pt8.jpg", "title": "Stage 8", "description": "บทที่8"},
  {"image": "assets/pt9.jpg", "title": "Stage 9", "description": "บทที่9"},
  {"image": "assets/pt10.jpg", "title": "Stage 10", "description": "บทที่10"},
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
