import 'package:flutter/material.dart';
import 'package:guessthecity/countries.dart';
import 'package:guessthecity/countryclass.dart';
import 'package:guessthecity/custom_button.dart';
import 'package:guessthecity/custom_card.dart';
import 'package:guessthecity/quiz.dart';
import 'package:guessthecity/score_card.dart';
import 'package:guessthecity/utils.dart';

class GuessCity extends StatefulWidget {
  const GuessCity({Key? key, required this.title}) ;

  final String title;

  @override
  State<GuessCity> createState() => _GuessCityState();
}
class _GuessCityState extends State<GuessCity> {
  bool askUser = false;

  Quiz quizScore =Quiz();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: getTextStyle()
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreCard(
                questionIndex: quizScore.questionIndex,
                totalScore: quizScore.totalScore),
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
                  style: getCardStyle()),
              onPress: showAnswer,
            ),
            SizedBox(height: 10),
            // CustomButton(
            //     title: askUser ? "Show Answer" : "Show Question",
            //      onPress: showAnswer,
            //     backgroundColor: Colors.blue),
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
        showEndAlert(context);
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
        showEndAlert(context);

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
