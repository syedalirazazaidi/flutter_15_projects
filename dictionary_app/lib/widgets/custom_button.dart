import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onPressed,
    this.backgroundColor = Colors.blueGrey,
  });
  final Color backgroundColor;
  final Widget title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.yellow, padding: EdgeInsets.all(8)),
        onPressed: () => onPressed(),
        child: title);
  }
}
