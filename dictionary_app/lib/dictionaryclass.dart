import 'package:dictionary_app/routes.dart';
import 'package:dictionary_app/screens/DictionaryScreen.dart';
import 'package:dictionary_app/theme/theme.dart';
import 'package:flutter/material.dart';

class DictionaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DictionaryScreen.routeName,
      // theme: CustomTheme,
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
