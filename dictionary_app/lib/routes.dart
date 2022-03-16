import 'package:dictionary_app/screens/DictionaryScreen.dart';
import 'package:dictionary_app/screens/audio.dart';
import 'package:dictionary_app/screens/dictionary_app.dart';
import 'package:flutter/material.dart';

abstract class CustomRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DictionaryApp.routeName:
        final String url=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AudioPlayerScreen(url: url));

      default:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());
    }
  }
}