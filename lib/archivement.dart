import 'package:flutter/material.dart';

void main() {
  runApp(Archivement());
}

class Archivement extends StatelessWidget {
  const Archivement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ArchivementPage(),
    );
  }
}

class ArchivementPage extends StatefulWidget {
  @override
  State<ArchivementPage> createState() => _ArchivementPageState();
}

class _ArchivementPageState extends State<ArchivementPage> {
  List<String> stageImages = [
    'assets/stage1.png',
    'assets/stage2.png',
    'assets/stage3.png',
    'assets/stage4.png',
    'assets/stage5.png',
    'assets/stage6.png',
    'assets/stage7.png',
    'assets/stage8.png',
    'assets/stage9.png',
    'assets/stage10.png',
    'assets/stage11.png',
  ];

  List<String> stageDescriptions = [
    'จุดเริ่มต้นของ Code',
    'การพบกับนักเวทหญิง',
    'ดาบแห่งโค้ด',
    'เส้นทางที่เต็มไปด้วยกับดัก',
    'คนป่ากับขวานอัลกอริทึม',
    'พักเหนื่อย',
    'สนามประลองอัลกอริทึม',
    'หมวกเกราะป้องกันไวรัส',
    'ปรับปรุงโค้ดให้ดีขึ้น',
    'ศึกสุดท้ายกับบอสใหญ่',
    'พิธีวิวาห์แห่งความมุ่งมั่น',
  ];

  List<bool> stageCompletion = [
    true,
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Archivement',
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('LogOut', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 10),
            const Text('Player01',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Achievement',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.75, // ปรับให้สมดุลทุกหน้าจอ
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: stageCompletion.length,
              itemBuilder: (context, index) {
                return AchievementCard(
                  stage: index + 1,
                  imagePath: stageImages[index],
                  description: stageDescriptions[index],
                  isCompleted: stageCompletion[index],
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final int stage;
  final String imagePath;
  final String description;
  final bool isCompleted;

  const AchievementCard({
    required this.stage,
    required this.imagePath,
    required this.description,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5, // ให้กรอบมีเงาสวยขึ้น
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text('Stage $stage',
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Icon(isCompleted ? Icons.check_circle : Icons.cancel,
                color: isCompleted ? Colors.green : Colors.red, size: 28),
          ],
        ),
      ),
    );
  }
}
