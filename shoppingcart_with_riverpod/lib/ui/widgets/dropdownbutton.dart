import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(

        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
        iconSize: 45.0,
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
        dropdownColor: Colors.white,
      ),
    );
  }
}
