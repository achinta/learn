import 'package:flutter/material.dart';

void main() => runApp(Quizzlet());

class Quizzlet extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: QuizPage()))));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow upstairs but not downstairs',
    'Approximately one quarter of human bones are in the feet',
    'A slugs\'s blood is green'
  ];
  List<bool> answers = [false, true, true];
  int questionNum = 0;

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(questions[questionNum],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0, color: Colors.white)),
                ))),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      setState(() {
                        if (answers[questionNum] == true) {
                          scoreKeeper
                              .add(Icon(Icons.check, color: Colors.green));
                        } else {
                          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                        }
                        questionNum++;
                      });
                    },
                    child: Text('True',
                        style:
                            TextStyle(color: Colors.white, fontSize: 20.0))))),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      setState(() {
                        if (answers[questionNum] == false) {
                          scoreKeeper
                              .add(Icon(Icons.check, color: Colors.green));
                        } else {
                          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                        }
                        questionNum++;
                      });
                    },
                    child: Text('False',
                        style:
                            TextStyle(color: Colors.white, fontSize: 20.0))))),
        Row(children: scoreKeeper)
      ],
    );
  }
}
