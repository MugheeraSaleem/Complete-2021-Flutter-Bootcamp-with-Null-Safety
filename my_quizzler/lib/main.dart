import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrains.dart';

Quizbrain quizBrain = Quizbrain();

void main() {
  runApp(const QuizzlerApp());
}

List<Widget> scoreboard = [];

List<Widget> choices = [
  Icon(
    Icons.check,
    color: Colors.green,
  ),
  Icon(
    Icons.cancel,
    color: Colors.red,
  )
];

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Center(
              child: Text(
                'Quizzler',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool user_selection) {
    bool correctAnswer = quizBrain.GetQAnswer();
    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();
          quizBrain.reset();
          scoreboard = [];
        } else {
          if (user_selection == correctAnswer) {
            scoreboard.add(choices[0]);
          } else {
            scoreboard.add(choices[1]);
          }
        }
        quizBrain.nextquestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.GetQText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(children: scoreboard)
      ],
    );
  }
}
