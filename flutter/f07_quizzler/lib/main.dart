import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank questionBank = QuestionBank();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quizzler'),
              backgroundColor: Colors.grey[900],
            ),
            body: SafeArea(
              child: QuizPage(),
            )));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var scoreKeeper = <Icon>[];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBank.getQuestionAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      if (questionBank.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        questionBank.reset();
        scoreKeeper = [];
      } else {
        questionBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(questionBank.getQuestionText()),
            // style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                checkAnswer(true);
              });
            },
            child: Text('True'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                checkAnswer(false);
              });
            },
            child: Text('False'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
