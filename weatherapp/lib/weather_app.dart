import 'package:flutter/material.dart';
import 'package:weatherapp/ui/screens/weather_screen.dart';
import 'package:weatherapp/ui/theme.dart';

class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      home:WeatherScreen(),
    );
  }
}
