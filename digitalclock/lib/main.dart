import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:async";

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _now = DateTime.now();
  // void initState() {
  //   Future.delayed(
  //     Duration(seconds: 1),
  //         () {
  //       setState(
  //             () {
  //           _now = DateTime.now();
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _now = DateTime.now();
      });
    });

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Digital Clock'),
      ),
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 110,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 5,
                  ),
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(_now.hour.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Quintessential',
                    )),
              ),
            ),
            Container(
              width: 110,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 5,
                  ),
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(_now.minute.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Quintessential',
                    )),
              ),
            ),
            Container(
              width: 110,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 5,
                  ),
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(_now.second.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Quintessential',
                    )),
              ),
            ),
          ],
        ),
      )),
      // body: Center(
      //   child: Row(
      //
      //     mainAxisAlignment: MainAxisAlignment.center,

      // children: <Widget>[
      //   const Text(
      //     'You have pushed the button this many times:',
      //   ),
      //   Text(
      //     '$_counter',
      //     style: Theme.of(context).textTheme.headline4,
      //   ),
      // ],
      //   ),
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
