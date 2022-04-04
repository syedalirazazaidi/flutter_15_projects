import 'package:flutter/material.dart';

abstract class CustomTheme {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      primaryColor: Color(0xffEDD5B3),
      appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 34, color: Colors.red),
        headline3: TextStyle(fontSize: 24, color: Colors.teal),
        headline2: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ));
}
// Colors.grey.shade50

// style: TextStyle(
//   fontSize: 33,
//       color: Colors.brown
// ),