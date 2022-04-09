import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/ui/screens/login_screen.dart';
import 'package:notice_board/ui/screens/notice_board_screen.dart';
import 'package:notice_board/ui/screens/signup_screen.dart';

abstract class  CustomRoutes{
  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder:(_)=>SignUpScreen());
      case NoticeBoardScreen.routeName:
        return MaterialPageRoute(builder:(_)=>NoticeBoardScreen());
      default:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
    }

  }
}