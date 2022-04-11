import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoticeBubble extends StatelessWidget {
  final String message;
  final Timestamp createdAt;
  final String createdBy;
  const NoticeBubble(
      {required this.createdAt,
      required this.message,
      required this.createdBy});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
          title: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '$createdBy @ ${createdAt.toDate()}',
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))));
  }
}
