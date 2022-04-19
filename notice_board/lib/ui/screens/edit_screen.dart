import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  static const routeName = '/editscreen';

  final String editid;
  EditScreen({required this.editid});

  TextEditingController messageInputField = TextEditingController();
  Future<void> updateMessage(id, message, createdAt, createdBy) async {
    try {
      return FirebaseFirestore.instance
          .collection('notices')
          .doc(id)
          .update({'message': message});
    } catch (e) {
      print('$e Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit your text"),
        ),
        body: Container(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('notices')
                    .doc(editid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return new Text("Loading");
                  }
                  var data = snapshot.data?.data();
                  var message = data!['message'];
                  var createdAt = data['createdAt'];
                  var createdBy = data['createdBy'];

                  return (Container(
                    margin: EdgeInsets.only(left: 4.0, top: 20.0, right: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          onChanged: (String val) => message = val,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: message,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(25),
                          child: FlatButton(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'Edit ',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () => updateMessage(
                                editid, message, createdBy, createdAt),
                          ),
                        )
                      ],
                    ),
                  ));
                })));
  }
}
