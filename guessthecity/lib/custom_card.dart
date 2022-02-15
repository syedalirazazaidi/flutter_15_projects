import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.width,
    this.height,
    this.decoration,
    this.bodyWidget,
    this.color,
    this.headingWidget,
    this.boxShadow,
    this.onPress,
  });
  final double? width;
  final double? height;
  final Widget? decoration;
  final Widget? headingWidget;
  final Widget? bodyWidget;
  final Widget? boxShadow;
  final Color? color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.white60,

              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 4.0,
            )
          ],
        ),
        child: Center(
          child: bodyWidget,

          // child:
          // Text(
          //     askUser
          //         ? 'Country:${_questions[_questionIndex].country}'
          //         : 'City:${_questions[_questionIndex].city}',
          //     style: TextStyle(
          //         fontSize: 22,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.blue.shade400))
        ),
      ),
    );
  }
}
