import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.setSource(AssetSource('note$soundNumber.wav'));
    player.resume();
  }

  // create a button widget
  Expanded getNoteButton(Color color, int soundNumber) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => playSound(soundNumber),
        // set color to the button
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text('Click Me'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getNoteButton(Colors.red, 1),
              getNoteButton(Colors.orange, 2),
              getNoteButton(Colors.yellow, 3),
              getNoteButton(Colors.green.shade200, 4),
              getNoteButton(Colors.green.shade600, 5),
              getNoteButton(Colors.blue, 6),
              getNoteButton(Colors.purple, 7)
            ],
          ),
        ),
      ),
    );
  }
}
