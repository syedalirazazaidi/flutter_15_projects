import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notice_board/constants/appString.dart';
import 'package:notice_board/constants/error.dart';
import 'package:notice_board/core/services/auth.dart';
import 'package:notice_board/core/services/db_services.dart';
import 'package:notice_board/ui/screens/login_screen.dart';
import 'package:notice_board/ui/screens/notices.dart';
import 'package:notice_board/ui/widget/custom_button.dart';
import 'package:notice_board/ui/widget/custom_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NoticeBoardScreen extends StatefulWidget {
  static const routeName = '/notices';

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
  String noticeText = '';
  AuthService _authService = AuthService();
  DBService _dbservice = DBService();
  TextEditingController messageInputField = TextEditingController();

  Future<void> signout() async {
    await _authService.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }

  Future<void> addData() async {
    try {
      await _dbservice.addNotification(
          noticeText, _authService.currentUser!.email!);
      messageInputField.clear();
    } catch (e) {
      Alert(
          context: context,
          title: ErrorString.error,
          desc: ErrorString.addNoticeError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.dashboardTitle),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading: false,
          actions: [
            CustomButton(
                title: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).primaryColor,
                onPress: signout)
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Notices(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomTextField(
                      controller: messageInputField,
                      onChange: (String val) {
                        setState(() {
                          noticeText = val;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      title: Icon(Icons.add, size: 32),
                      backgroundColor: Theme.of(context).primaryColor,
                      onPress: addData),
                )
              ],
            )
          ],
        ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:notice_board/core/services/auth.dart';
//
// class NoticeBoardScreen extends StatefulWidget {
//   static const routeName = '/notices';
//   AuthService _authService = AuthService();
//
//
//
//   @override
//   State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
// }
//
// class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('ko'),
//
//     );
//   }
// }
