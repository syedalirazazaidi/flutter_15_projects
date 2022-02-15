import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guessthecity/countries.dart';
import 'package:guessthecity/countryclass.dart';
import 'package:guessthecity/custom_button.dart';
import 'package:guessthecity/custom_card.dart';
import 'package:guessthecity/quiz.dart';
// import 'package:guessthecity/custom_card.dart';
// import 'package:guessthecity/custom_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GuessCity(title: 'Guess The Capital City'),
    );
  }
}

class GuessCity extends StatefulWidget {
  const GuessCity({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GuessCity> createState() => _GuessCityState();
}

class _GuessCityState extends State<GuessCity> {
  bool askUser = false;

  Quiz quizScore = Quiz();

  final List listCountry = [];
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final ButtonStyle styleCorrect = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20, color: Colors.green));
  List _questions = countries
      .map((question) =>
          Country(country: question['country']!, city: question['city']!))
      .toList();

  void _resetCounter() {
    setState(() {
      quizScore.resetCounter();
    });
  }

  void showEndAlert() {
    Alert(
      context: context,
      title: "ALERT",
      desc: "You have already reached to the end of list.",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Quintessential',
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              width: 320,
              height: 50,
              color: Colors.green,
              bodyWidget: Text(
                'Score ${quizScore.totalScore}/${quizScore.questionIndex}',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomCard(
              height: 180,
              width: 320,
              color: Colors.white70,
              bodyWidget: Text(
                  askUser
                      ? 'Country:${_questions[quizScore.questionIndex].country}'
                      : 'City:${_questions[quizScore.questionIndex].city}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade400)),
            ),
            SizedBox(height: 10),
            CustomButton(
                title: askUser ? "Show Answer" : "Show Question",
                onPress: showAnswer,
                backgroundColor: Colors.blue),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    title: 'Correct',
                    onPress: correctFunc,
                    backgroundColor: Colors.green,
                  ),
                  CustomButton(
                      title: 'Wrong',
                      onPress: wrongFunc,
                      backgroundColor: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reset',
            child: const Text('Reset'),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void correctFunc() {
    setState(() {
      // _questionIndex++;
      if (quizScore.questionIndex + 1 == _questions.length) {
        showEndAlert();
        _resetCounter();
      } else {
        quizScore.correctFunc();
      }
    });
  }

  void wrongFunc() {
    setState(() {
      // _questionIndex++;
      if (quizScore.questionIndex + 1 == _questions.length) {
        showEndAlert();

        _resetCounter();
      } else {
        quizScore.wrongFunc();
      }
    });
  }

  void showAnswer() {
    setState(() {
      askUser = !askUser;
    });
  }
}
