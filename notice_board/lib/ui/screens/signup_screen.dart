import 'package:flutter/material.dart';
import 'package:notice_board/constants/appConfig.dart';
import 'package:notice_board/constants/appString.dart';
import 'package:notice_board/constants/error.dart';
import 'package:notice_board/core/services/auth.dart';
import 'package:notice_board/ui/screens/login_screen.dart';
import 'package:notice_board/ui/widget/custom_button.dart';
import 'package:notice_board/ui/widget/custom_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthService authService = AuthService();
  String email = '';
  String password = '';
  String repassword = '';
  Future<void> signUp() async {
    try {
      final user = await authService.createUser(email, password);
      if (user != null) {
        Navigator.pop(context);
      }
    } catch (e) {
      Alert(
              context: context,
              title: ErrorString.error,
              desc: ErrorString.userCreationFailed)
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.signup),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                  onChange: (String value) {
                    setState(() {
                      email = value;
                    });
                  }),
              CustomTextField(
                leading: Icon(
                  Icons.password_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
                hintText: AppStrings.passwordInput,
                onChange: (String value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              CustomTextField(
                leading: Icon(
                  Icons.password_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
                hintText: AppStrings.reenterpassword,
                onChange: (String value) {
                  setState(() {
                    repassword = value;
                  });
                },
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      title: Text(
                        AppStrings.register,
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      onPress: signUp,
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
