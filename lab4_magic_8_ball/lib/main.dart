import 'dart:math'; 
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;

  final List<String> predictions = [
    'Chắc chắn là có! (Yes)',
    'Hãy hỏi lại sau nhé! (Ask Again Later)',
    'Hoàn toàn không! (No)',
    'Triển vọng rất tốt! (Very Likely)',
    'Đừng trông mong gì! (Don\'t Count On It)',
  ];

  void askBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800, 
      appBar: AppBar(
        title: const Text(
          'Magic 8 Ball',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hãy nghĩ về câu hỏi trong đầu\nvà chạm vào quả cầu để nhận lời phán:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24.0),

              TextButton(
                onPressed: askBall,
                child: Image.asset(
                  'assets/ball$ballNumber.png',
                  width: 280.0,
                  height: 280.0,
                ),
              ),
              const SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  predictions[ballNumber - 1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),

              ElevatedButton.icon(
                onPressed: askBall,
                icon: const Icon(Icons.auto_awesome, color: Colors.blueAccent),
                label: const Text(
                  'HỎI TIÊN TRI',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36.0,
                    vertical: 14.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}