import 'package:codecraft/stage2.dart';
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
  int _characterRow = 0;
  int _characterCol = 0;
  bool _isGridVisible = false;
  bool _showAnswer = false;
  String _feedback = '';

  // คำสั่งที่ถูกต้อง
  final List<String> correctCommands = [
    "justify-content: center;",
    "justify-content: space-between;",
    "justify-content: space-around;",
    "justify-content: space-evenly;",
    "align-items: center;",
    "align-items: flex-end;",
    "flex-direction: column;",
    "flex-direction: row-reverse;",
    "flex-direction: column-reverse;",
    "justify-content: flex-end;",
    "align-self: center;"
  ];

  void _moveCharacter(String command) {
    setState(() {
      if (command == "justify-content: flex-end;") {
        _characterRow = 0;
        _characterCol = 4;
      } else if (command == "justify-content: center;") {
        _characterRow = 0;
        _characterCol = 2;
      } else if (command == "justify-content: space-between;") {
        _characterRow = 0;
        _characterCol = 4;
      } else if (command == "justify-content: space-around;") {
        _characterRow = 2;
        _characterCol = 3;
      } else if (command == "justify-content: space-evenly;") {
        _characterRow = 2;
        _characterCol = 1;
      } else if (command == "align-items: center;") {
        _characterRow = 1;
        _characterCol = 2;
      } else if (command == "align-items: flex-end;") {
        _characterRow = 4;
        _characterCol = 2;
      } else if (command == "flex-direction: column;") {
        _characterRow = 3;
        _characterCol = 3;
      } else if (command == "flex-direction: row-reverse;") {
        _characterRow = 0;
        _characterCol = 0;
      } else if (command == "flex-direction: column-reverse;") {
        _characterRow = 4;
        _characterCol = 0;
      } else if (command == "justify-content: flex-end;") {
        _characterRow = 4;
        _characterCol = 3;
      } else if (command == "align-self: center;") {
        _characterRow = 1;
        _characterCol = 3;
      }
    });
  }

  void _checkAnswer() {
    String answer = _answerController.text.trim();
    if (answer == "justify-content: center;") {
      setState(() {
        _feedback = 'Correct! Well done!';
      });
      // แสดง Dialog เมื่อคำตอบถูกต้อง
      _showCompletionDialog();
    } else {
      setState(() {
        _feedback = 'Incorrect! Try again.';
      });
    }
  }

  // ฟังก์ชันสำหรับการแสดง Dialog
  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // ไม่ให้ปิด dialog เมื่อคลิกที่นอก dialog
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20),
          backgroundColor: Colors.black87,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // แสดงตัวละคร
              Image.asset('assets/boy.png', width: 100, height: 100),
              SizedBox(height: 10),
              Text(
                'Stage 1 completed!',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Next stage',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              // ปุ่มที่ให้ไปยังหน้าถัดไป
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // ปิด dialog
                  // ไปยังหน้าถัดไป
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Stage2()));
                },
                child: Text('Go to Next Stage'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _logout() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Logging out...")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              onPressed: _logout,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 18),
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
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 36, 152, 247),
                    const Color.fromARGB(255, 0, 94, 255)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                'Stage 1',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Hello, here is a task for you...',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAnswer = !_showAnswer;
                });
              },
              child: Text(
                'Show Answer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
            ),
            if (_showAnswer) ...[
              SizedBox(height: 10),
              Text(
                "The correct answer is:\njustify-content: center;",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
            SizedBox(height: 20),
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/grass.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  if (_isGridVisible)
                    Positioned.fill(
                      child: Column(
                        children: List.generate(5, (rowIndex) {
                          return Expanded(
                            child: Row(
                              children: List.generate(5, (colIndex) {
                                return Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                      ),
                    ),

                  // Apple 1
                  Positioned(
                    top: (0 * (350 / 5)) + (350 / 8) - 15,
                    left: (2 * (350 / 5)) + (350 / 8) - 15,
                    child: Image.asset(
                      'assets/apple.png',
                      width: 30,
                      height: 40,
                    ),
                  ),
                  Positioned(
                    top: (_characterRow * (350 / 5)) + (350 / 10) - 25,
                    left: (_characterCol * (350 / 5)) + (350 / 10) - 25,
                    child: Image.asset(
                      'assets/boy.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Checkbox(
                  value: _isGridVisible,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isGridVisible = newValue ?? false;
                    });
                  },
                ),
                Text("Show Grid", style: TextStyle(color: Colors.white)),
              ],
            ),
            Text('Here\'s a CSS code editor below:',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('1', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "#field {",
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('2', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 4),
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
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Text('3', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 4),
                        Expanded(
                          child: TextField(
                            controller: _answerController,
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Type your code here...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            onChanged: (text) {
                              _moveCharacter(text.trim());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _checkAnswer,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 36, 152, 247),
                        const Color.fromARGB(255, 0, 94, 255)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    "Check Answer",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_feedback.isNotEmpty) ...[
              Text(
                _feedback,
                style: TextStyle(
                    color: _feedback.contains('Correct')
                        ? Colors.green
                        : Colors.red,
                    fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
