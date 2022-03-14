import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({required this.onChange});
  final void Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        onChanged: onChange,
        style: TextStyle(color: Colors.black12, fontSize: 18),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          icon: new Icon(
            Icons.text_fields,
            color: Colors.black,
            size: 32,
          ),
          // hintText: ,
          filled: true,
        ),
      ),
    );
  }
}
