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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: new InputDecoration(
                icon: new Icon(Icons.text_fields, color: Colors.white),
                hintText: 'Enter Word here...',
                // border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 32.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow, padding: EdgeInsets.all(8)),
                  onPressed: () {},
                  child: new Icon(
                    Icons.near_me,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 1.0,
              vertical: 30.0,
            ),
            child: Container(
              height: 2.0,
              // width: 10,
              // width:1690.0,
              color: Colors.yellow,
            ),
          ),
          // const Divider(
          //   color: Colors.yellow,
          //   height: 25,
          //   thickness: 2,
          // ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.red, // background
          //     onPrimary: Colors.white, // foreground
          //   ),),
          // ElevatedButton(onPressed: (){}, child: child)

          // TextField(
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8),
          //         borderSide: BorderSide.none,
          //       ),
          //       fillColor: Colors.white,
          //       filled: true,
          //       hintText: 'Enter Word here...',
          //       // fillColor: Colors.grey[100]),
          //     ),
          //   ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: TextField(
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(8),
          //           borderSide: BorderSide.none,
          //         ),
          //         fillColor: Colors.white,
          //         filled: true,
          //         hintText: 'Enter Word here...',
          //         // fillColor: Colors.grey[100]),
          //       ),
          //     ),
          //   ),
          // ),
          // IconButton(
          //   icon: Icon(Icons.visibility),
          //   onPressed: () {
          //     print('object');
          //   },
          // ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 18, bottom: 1),
          //       // child: IconButton(
          //       //   icon: const Icon(Icons.send),
          //       //   tooltip: 'send to',
          //       //   onPressed: () {},
          //       // ),
          //     ),
          //   ],
          // ),

          // prefixIcon: Icon(Icons.search),
          // border: InputBorder.none,
        ],
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
