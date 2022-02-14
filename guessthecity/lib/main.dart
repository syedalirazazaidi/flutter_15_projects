import 'package:flutter/material.dart';
import 'package:guessthecity/countries.dart';
import 'package:guessthecity/countryclass.dart';
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
  int _questionIndex = 0;
  int _totalScore = 0;
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
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  // _questionIndex+1==_questions.length;
  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();
  }

  alertFunction() {
    ElevatedButton(
      child: Text("Click Me"),
      onPressed: () {
        Alert(
                context: context,
                title: " Alert",
                desc: "You have already reached end of the list.")
            .show();
      },
    );
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
            Container(
              child: Text('Score $_totalScore/$_questionIndex'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 340,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Center(
                  child: Text(
                      askUser
                          ? 'Country:${_questions[_questionIndex].country}'
                          : 'City:${_questions[_questionIndex].city}',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade400))),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: style,
              onPressed: () {
                setState(() {
                  askUser = !askUser;
                });
              },
              child: Text(askUser ? "Show Answer" : "Show Question"),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_questionIndex + 1 == _questions.length) {
                          Alert(
                            context: context,
                            title: "ALERT",
                            desc:
                                "You have already reached to the end of list.",
                          ).show();
                          _resetCounter();
                        } else {
                          _totalScore++;
                          _questionIndex++;
                        }
                      });
                    },
                    child: const Text('Correct'),
                  ),
                  ElevatedButton(
                    // style: styleCorrect,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        // _questionIndex++;
                        if (_questionIndex + 1 == _questions.length) {
                          Alert(
                            context: context,
                            title: "ALERT",
                            desc:
                                "You have already reached to the end of list.",
                          ).show();
                          _resetCounter();
                        } else {
                          _questionIndex++;
                        }
                      });
                    },
                    child: const Text('Wrong'),
                  ),
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
}
