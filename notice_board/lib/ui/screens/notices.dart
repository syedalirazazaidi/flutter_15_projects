import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/constants/error.dart';
import 'package:notice_board/core/services/db_services.dart';
import 'package:notice_board/ui/widget/notice_bubble.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Notices extends StatelessWidget {
  DBService _dbService = DBService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _dbService.getDataStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Alert(
                    context: context,
                    title: ErrorString.dataLoadError,
                    desc: ErrorString.userCreationFailed)
                .show();
          } else if (snapshot.data?.docs.length == 0) {
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Notices',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            );
          }
           print(snapshot.data?.docs.map((e) => print(e.id)));

          List<Widget> messages = snapshot.data?.docs
                  .map(
                    (record) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: NoticeBubble(
                        createdAt: record['createdAt'],
                        createdBy: record['createdBy'],
                        message: record['message'],
                        id:record.id

                      ),
                    ),
                  )
                  .toList() ??
              [];
          return Expanded(child: ListView(children: messages));
        });
  }
}
