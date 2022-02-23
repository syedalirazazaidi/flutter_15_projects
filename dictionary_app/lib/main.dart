import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Dictionary-App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Center(child: Text(widget.title)),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,

                      // borderSide: BorderSide(color: Colors.transparent)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Word here...',

                    // fillColor: Colors.grey[100]),
                  ),
                ),
              ),


            ),



              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 18,bottom: 1),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      tooltip: 'send to',
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),





            // prefixIcon: Icon(Icons.search),
            // border: InputBorder.none,
          ],
        ),
      ),

      // body: Center(
      //   child: Row(
      //     TextField(
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(),
      //         hintText: 'Enter a search term',
      //       ),
      //     ),
      //   )
      //
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
