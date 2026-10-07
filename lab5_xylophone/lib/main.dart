import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey({
    required Color color,
    required int soundNumber,
    required String noteName,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, 
          ),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(
          noteName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Xylophone',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade900,
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, soundNumber: 1, noteName: 'ĐÔ (C)'),
              buildKey(color: Colors.orange, soundNumber: 2, noteName: 'RÊ (D)'),
              buildKey(color: Colors.yellow.shade700, soundNumber: 3, noteName: 'MI (E)'),
              buildKey(color: Colors.green, soundNumber: 4, noteName: 'FA (F)'),
              buildKey(color: Colors.teal, soundNumber: 5, noteName: 'SON (G)'),
              buildKey(color: Colors.blue, soundNumber: 6, noteName: 'LA (A)'),
              buildKey(color: Colors.purple, soundNumber: 7, noteName: 'SI (B)'),
            ],
          ),
        ),
      ),
    );
  }
}