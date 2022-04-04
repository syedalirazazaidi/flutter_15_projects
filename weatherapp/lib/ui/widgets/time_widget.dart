import 'package:flutter/material.dart';

class GetTime extends StatelessWidget {

  GetTime(this.day,this.month);
  String day;
  String month;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text( 'Today $day $month',
        style: TextStyle(color: Colors.indigo,fontSize: 15),),
    );

  }
}
