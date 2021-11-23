import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audiocache'

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playAudio(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Expanded buildKey(int soundNum, Color color) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: () => playAudio(soundNum),
          child: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.yellow),
            buildKey(4, Colors.green),
            buildKey(5, Colors.teal),
            buildKey(6, Colors.blue),
            buildKey(7, Colors.purple),
          ],
        )),
      ),
    );
  }
}
