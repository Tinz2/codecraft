import 'package:codecraft/stage6.dart';
import 'package:flutter/material.dart';

//Method หลักทีRun
void main() {
  runApp(Stage5());
}

class Stage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Stage5Screen(),
    );
  }
}

class Stage5Screen extends StatefulWidget {
  @override
  _Stage5ScreenState createState() => _Stage5ScreenState();
}

class _Stage5ScreenState extends State<Stage5Screen> {
  TextEditingController _answerController = TextEditingController();
  int _princeRow = 0;
  int _princeCol = 0;
  int _princessRow = 0;
  int _princessCol = 1; // เจ้าหญิงอยู่ที่ (row 0, col 1) ตามเริ่มต้น
  int _prince1Row = 0;
  int _prince1Col = 2;
  bool _isGridVisible = false;
  bool _showAnswer = false;
  String _feedback = '';

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
      if (command == "flex-direction: row-reverse;") {
        // เจ้าชายย้ายไปที่ (row 0, col 1)
        _princeRow = 0;
        _princeCol = 2;

        // เจ้าหญิงย้ายไปที่ (row 0, col 3)
        _princessRow = 0;
        _princessCol = 3;

        _prince1Row = 0;
        _prince1Col = 4;
      } else if (command == "justify-content: space-between;") {
        _princeRow = 0;
        _princeCol = 4;
        _princessRow = 2;
        _princessCol = 1;
      } else if (command == "justify-content: center;") {
        _princeRow = 0;
        _princeCol = 2;
        _princessRow = 0;
        _princessCol = 2;
      } else if (command == "justify-content: space-around;") {
        _princeRow = 2;
        _princeCol = 3;
        _princessRow = 2;
        _princessCol = 1;
      } else if (command == "align-items: center;") {
        _princeRow = 1;
        _princeCol = 2;
        _princessRow = 1;
        _princessCol = 2;
      } else if (command == "align-items: flex-end;") {
        _princeRow = 4;
        _princeCol = 2;
        _princessRow = 4;
        _princessCol = 2;
      } else if (command == "flex-direction: column;") {
        _princeRow = 3;
        _princeCol = 3;
        _princessRow = 3;
        _princessCol = 3;
      } else if (command == "flex-direction: row-reverse;") {
        _princeRow = 0;
        _princeCol = 0;
        _princessRow = 0;
        _princessCol = 0;
      } else if (command == "flex-direction: column-reverse;") {
        _princeRow = 4;
        _princeCol = 0;
        _princessRow = 4;
        _princessCol = 0;
      } else if (command == "justify-content: flex-end;") {
        _princeRow = 4;
        _princeCol = 3;
        _princessRow = 4;
        _princessCol = 3;
      } else if (command == "align-self: center;") {
        _princeRow = 1;
        _princeCol = 3;
        _princessRow = 1;
        _princessCol = 3;
      }
    });
  }

  void _checkAnswer() {
    String answer = _answerController.text.trim();
    if (correctCommands.contains(answer)) {
      setState(() {
        _feedback = 'Correct! Well done!';
      });
      _showCompletionDialog();
    } else {
      setState(() {
        _feedback = 'Incorrect! Try again.';
      });
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20),
          backgroundColor: Colors.black87,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/boy.png', width: 100, height: 100),
              SizedBox(height: 10),
              Text(
                'Stage 5 completed!',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Next stage',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Stage6())); // ปิด dialog// Next stage logic here
                },
                child: Text('Go to Next Stage'),
              ),
            ],
          ),
        );
      },
    );
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
              onPressed: () {
                Navigator.pop(context);
              },
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
                'Stage 5',
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
                "The correct answer is:\nflex-direction: row-reverse;",
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

                  // แอปเปิ้ล 1 (ลูกที่ 1)
                  Positioned(
                    top: (0 * (350 / 5)) + (350 / 10) - (40 / 2),
                    left: (2 * (350 / 5)) + (350 / 8) - (30 / 2),
                    child: Image.asset(
                      'assets/apple.png',
                      width: 30,
                      height: 40,
                    ),
                  ),
                  // แอปเปิ้ล 2 (ลูกที่ 2)
                  Positioned(
                    top: (0 * (350 / 5)) + (350 / 10) - (40 / 2),
                    left: (3 * (350 / 5)) + (350 / 8) - (30 / 2),
                    child: Image.asset(
                      'assets/apple.png',
                      width: 30,
                      height: 40,
                    ),
                  ),
                  // แอปเปิ้ล 3 (ลูกที่ 3)
                  Positioned(
                    top: (0 * (350 / 5)) + (350 / 10) - (40 / 2),
                    left: (4 * (350 / 5)) + (350 / 8) - (30 / 2),
                    child: Image.asset(
                      'assets/apple.png',
                      width: 30,
                      height: 40,
                    ),
                  ),
                  Positioned(
                    top: (_princeRow * (350 / 5)) + (350 / 10) - 25,
                    left: (_princeCol * (350 / 5)) + (350 / 10) - 25,
                    child: Image.asset(
                      'assets/boy.png',
                      width: 60,
                      height: 50,
                    ),
                  ),
                  // เจ้าหญิง
                  Positioned(
                    top: (_princessRow * (350 / 5)) + (350 / 10) - 25,
                    left: (_princessCol * (350 / 5)) + (350 / 10) - 25,
                    child: Image.asset(
                      'assets/girl.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: (_prince1Row * (350 / 5)) + (350 / 10) - 25,
                    left: (_prince1Col * (350 / 5)) + (350 / 10) - 25,
                    child: Image.asset(
                      'assets/boy.png',
                      width: 60,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isGridVisible,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isGridVisible = newValue!;
                    });
                  },
                ),
                Text('Show Grid'),
              ],
            ),
            SizedBox(height: 20),
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
