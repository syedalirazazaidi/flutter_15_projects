import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextStyle getTextStyle() => TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: 'Quintessential',
    );
TextStyle getCardStyle() => TextStyle(
      fontSize: 32,
      color: Colors.blue,
      fontWeight: FontWeight.w400,
      fontFamily: 'Quintessential',
    );
void showEndAlert(BuildContext context) {
  Alert(
    context: context,
    title: "ALERT",
    desc: "You have already reached to the end of list.",
  ).show();
}
