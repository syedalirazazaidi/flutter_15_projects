import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onPress,
    this.backgroundColor = Colors.blueAccent,
  });
  final String title;
  final VoidCallback onPress;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(title),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
    );
  }
}
