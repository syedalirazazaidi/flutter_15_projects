import 'package:flutter/material.dart';

abstract class CustomTheme {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      primaryColor: Colors.amber,
      appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade900),
      textTheme: TextTheme(

        headline4: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24,
          color: Colors.white,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18,
          color: Colors.indigo,
        ),
      ),
    cardTheme: CardTheme(
      color: Colors.blueGrey.shade900,
      elevation: 30,
      shadowColor: Colors.green
    )

  );
}