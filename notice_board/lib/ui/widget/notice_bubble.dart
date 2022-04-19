import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/constants/error.dart';
import 'package:notice_board/core/services/db_services.dart';
import 'package:notice_board/ui/screens/edit_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../core/services/auth.dart';

class NoticeBubble extends StatefulWidget {
  final Timestamp createdAt;
  final String createdBy;
  final String message;
  final String id;

  const NoticeBubble({
    required this.createdAt,
    required this.createdBy,
    required this.message,
    required this.id,
  });
  @override
  State<NoticeBubble> createState() => _NoticeBubbleState();
}

String currentuser = '';
DBService _dbService = DBService();

Future<void> deleteData(id) async {
  try {
    await _dbService.deleteData(id);
  } catch (e) {
    print(e);
  }
}

Future<void> editData(data) async {
  print("$data EDITED");



}

class _NoticeBubbleState extends State<NoticeBubble> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // print();
    final currentuser = _authService.currentUser?.email;

    return Container(
        child: ListTile(
          title: Text(
            widget.message,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${widget.createdBy} @ ${widget.createdAt.toDate()}',
            style: TextStyle(color: Colors.grey.shade400),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                if (currentuser == widget.createdBy) ...[
                  IconButton(
                      onPressed: () =>
                      // {editData(widget)},
            // Navigator.pushNamed(context, EditScreen.routeName)

        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditScreen(editid:widget.id),
        ))
                      ,


                      icon: Icon(Icons.edit)
                  ),

                  IconButton(
                      onPressed: () => {deleteData(widget.id)},
                      icon: Icon(Icons.delete)),
                ] else
                  Container()
              ],
            ),

          ),


        ),


        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))));
  }
}
