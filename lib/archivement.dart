import 'package:flutter/material.dart';

void main() {
  runApp(Archivement());
}

class Archivement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AchievementScreen(),
    );
  }
}

class AchievementScreen extends StatelessWidget {
  // List of images for each stage
  final List<String> stageImages = [
    'assets/a1.JPG', // Image for Stage 1
    'assets/a2.png', // Image for Stage 2
    'assets/a3.png', // Image for Stage 3
    'assets/a4.png', // Image for Stage 4
    'assets/a5.png', // Image for Stage 5
    'assets/a6.png', // Image for Stage 6
    'assets/a7.png', // Image for Stage 7
    'assets/a8.png', // Image for Stage 8
    'assets/a9.png', // Image for Stage 9
    'assets/a10.png', // Image for Stage 10
  ];

  // List of messages for each stage
  final List<String> stageMessages = [
    'Stage 1: First achievement reached!',
    'Stage 2: Keep going, you\'re doing great!',
    'Stage 3: Midway milestone!',
    'Stage 4: Almost there!',
    'Stage 5: Halfway to the finish line!',
    'Stage 6: Getting closer!',
    'Stage 7: One more to go!',
    'Stage 8: Almost at the top!',
    'Stage 9: So close!',
    'Stage 10: Congratulations, you did it!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Archivement',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              'LogOut',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          const Text(
            'Player01',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Text(
            'Achievement',
            style: TextStyle(
                color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                bool isCompleted = index < 7;
                return AchievementCard(
                  stage: index + 1,
                  isCompleted: isCompleted,
                  imagePath: stageImages[
                      index], // Pass the correct image for the stage
                  message: stageMessages[
                      index], // Pass the correct message for the stage
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final int stage;
  final bool isCompleted;
  final String imagePath; // Accept image path as a parameter
  final String message; // Accept message as a parameter

  const AchievementCard(
      {required this.stage,
      required this.isCompleted,
      required this.imagePath,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,
              height: 80), // Use the image passed to the card
          const SizedBox(height: 10),
          Text(
            'Stage $stage',
            style: const TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              message, // Display the message passed for the stage
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            isCompleted ? Icons.check_circle : Icons.cancel,
            color: isCompleted ? Colors.green : Colors.red,
            size: 24,
          ),
        ],
      ),
    );
  }
}
