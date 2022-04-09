import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/constants/appConfig.dart';
import 'package:notice_board/constants/appString.dart';
import 'package:notice_board/ui/screens/notice_board_screen.dart';
import 'package:notice_board/ui/screens/signup_screen.dart';
import 'package:notice_board/ui/widget/custom_button.dart';
import 'package:notice_board/ui/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName='/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
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
                  onChange: (string) {}),

              CustomTextField(
                leading: Icon(
                  Icons.password_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
                hintText: AppStrings.passwordInput,
                onChange: (string) {},
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
                      onPress: () {
                        Navigator.pushNamed(context, NoticeBoardScreen.routeName);
                      },
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
