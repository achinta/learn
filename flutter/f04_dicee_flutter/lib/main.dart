import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  // this method needs to be overridden as it is stateful.
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 5;

  int getRandomNumber() {
    return Random().nextInt(6) + 1;
  }

  void changeDiceFace() {
    leftDiceNumber = getRandomNumber();
    rightDiceNumber = getRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //have a look at Expanded, that will resize the image to fit the screen
          // we can also have a ratio of the space that each widget takes up, using flex property
          Expanded(
              // Button should have the same color as the background
              // so that it looks like a dice. How to do that?
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = Random().nextInt(6) + 1;
                      rightDiceNumber = Random().nextInt(6) + 1;
                    });
                    print('Left button got pressed');
                  },
                  child: Image(
                      image: AssetImage('images/dice$leftDiceNumber.png')))),
          Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = Random().nextInt(6) + 1;
                      rightDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'))),
        ],
      ),
    );
  }
}
