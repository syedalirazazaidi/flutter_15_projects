import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/constants/appConfig.dart';
import 'package:notice_board/constants/appString.dart';
import 'package:notice_board/constants/error.dart';
import 'package:notice_board/core/services/auth.dart';
import 'package:notice_board/ui/screens/notice_board_screen.dart';
import 'package:notice_board/ui/screens/signup_screen.dart';
import 'package:notice_board/ui/widget/custom_button.dart';
import 'package:notice_board/ui/widget/custom_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  AuthService _authService = AuthService();
  Future<void> login() async {
    try {
      if (email == '' || password == '') {
        Alert(
                context: context,
                title: ErrorString.error,
                desc: ErrorString.missingcredentials)
            .show();
        return;
      }
      await _authService.login(email, password);
      Navigator.pushNamed(context, NoticeBoardScreen.routeName);
    } catch (e) {
      Alert(
              context: context,
              title: ErrorString.error,
              desc: ErrorString.loginFailed)
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppConfig.logoImage),
              CustomTextField(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    size: 32,
                  ),
                  hintText: AppStrings.emailInput,
                  onChange: (String val) {
                    setState(() {
                      email = val;
                    });
                  }),
              CustomTextField(
                leading: Icon(
                  Icons.password_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
                hintText: AppStrings.passwordInput,
                onChange: (String val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    title: Text(
                      AppStrings.signup,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    onPress: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      title: Text(
                        AppStrings.login,
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      onPress: login,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
