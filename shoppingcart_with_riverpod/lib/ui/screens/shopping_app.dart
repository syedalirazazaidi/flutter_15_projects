import 'package:flutter/material.dart';
import 'package:shoppingcart_with_riverpod/ui/screens/main_screen.dart';

import 'package:shoppingcart_with_riverpod/ui/route.dart';

class ShoppingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: MainScreen.routeName,
      home: MainScreen(),

    );
  }
}
