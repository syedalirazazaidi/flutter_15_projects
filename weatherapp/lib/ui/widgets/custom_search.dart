import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/constants/appString.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({
    required this.onSubmit,
  });
  final void Function(String) onSubmit;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onSubmitted: onSubmit,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 17),
          hintText: AppStrings.hintText,
          suffixIcon: Icon(
            Icons.search,
            size: 35,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
