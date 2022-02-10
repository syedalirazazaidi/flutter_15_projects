import 'package:flutter/material.dart';
import 'package:guessthecity/countries.dart';
import 'package:guessthecity/countryclass.dart';

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
  int _counter = 0;
  bool askUser = false;

  final List listCountry = [];
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final ButtonStyle styleCorrect = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20, color: Colors.green));

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // listTest.add(Country(name: "Brother Daxin", sex: "Male"));
    // Country country = Country();

    // listCountry.add(country.countriesJson);

    // void _renderCountry() {
    //     for (int i = 0; i < listCountry.length; i++) {
    //       if (listCountry.isNotEmpty) {
    //        print (listCountry[i]['country']);
    //
    //       }
    //     }
    //   }

    // var _questions = countries.map((question) =>
    //     Country(country: question!['country'], city: question!['city'])
    // ).toList();








    // List _questions = countries.map(
    //       (question) => Country(
    //       country: question['country'],
    //       city: question['city'],
    //
    // );
    // ).toList();

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
              child: Text('Score 0/0'),
            ),
            SizedBox(height: 20),
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
                  child: Text('Country:',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
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
                    onPressed: () {},
                    child: const Text('Correct'),
                  ),
                  ElevatedButton(
                    // style: styleCorrect,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {},
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
            onPressed: _incrementCounter,
            tooltip: 'Reset',
            child: const Text('Reset'),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
