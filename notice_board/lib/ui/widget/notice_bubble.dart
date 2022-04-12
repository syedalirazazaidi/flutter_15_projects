
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/constants/error.dart';
import 'package:notice_board/core/services/db_services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NoticeBubble extends StatefulWidget {
  final Timestamp createdAt;
  final String createdBy;
  final String message;
  const NoticeBubble({
    required this.createdAt,
    required this.createdBy,
    required this.message,
  });

  @override
  State<NoticeBubble> createState() => _NoticeBubbleState();
}
DBService _dbService = DBService();

Future<void> deleteData(id) async {

  try{
   final responcse= await _dbService.deleteData(id);
   print(responcse);

  }
  catch(e){
    print(e);

  }
  // try{
  //   await _dbService.deleteData(id);
  // }
  // catch(e){
  //   print(e);
      // Alert(
      //     context: context,
      //     title: ErrorString.error,
      //     desc: ErrorString.addNoticeError);
    // }

  }

  // try {
  //   await _dbservice.addNotification(
  //       noticeText, _authService.currentUser!.email!);
  //   messageInputField.clear();
  // } catch (e) {
  //   Alert(
  //       context: context,
  //       title: ErrorString.error,
  //       desc: ErrorString.addNoticeError);
  // }
// }
Future <void> editData()async{


}


class _NoticeBubbleState extends State<NoticeBubble> {
  @override
  Widget build(BuildContext context) {
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
                IconButton(
                    onPressed: () => {editData()}, icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () => {deleteData(widget.createdAt)}, icon: Icon(Icons.delete)
                ),
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
