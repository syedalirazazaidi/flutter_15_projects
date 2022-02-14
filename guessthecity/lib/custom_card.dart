import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
     this.width,
     this.height,
    this.decoration,
    this.bodyWidget,
    this.color

  });
  final double? width;
  final double? height;
  final Widget? decoration;
  final Widget? bodyWidget;
  final String ?color;

  @override
  Widget build(BuildContext context) {
    return CustomCard();
  }
}
