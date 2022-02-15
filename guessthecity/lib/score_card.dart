import 'package:flutter/material.dart';

import 'custom_card.dart';

class ScoreCard extends StatelessWidget {
  ScoreCard({this.totalScore = 0, this.questionIndex = 0});
  int totalScore;
  int questionIndex;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: 320,
      height: 50,
      color: Colors.green,
      bodyWidget: Text(
        'Score ${totalScore}/${questionIndex}',
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
