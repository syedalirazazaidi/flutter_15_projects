import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
          } else if (!snapshot.hasData) {
            return Text('No Notices');
          }
          List<Widget> messages = snapshot.data?.docs
                  .map(
                    (record) => Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: NoticeBubble(
                        createdAt: record['createdAt'],
                        message: record['message'],
                        createdBy: record['createdBy'],
                      ),
                    ),
                  )
                  .toList() ??
              [];
          return Expanded(
            child: ListView(
              children: messages,

            ),
          );
          // print(snapshot.data?.docs.first.data());
          // return Text(snapshot.data?.docs.length.toString()??'');
        });
  }
}
