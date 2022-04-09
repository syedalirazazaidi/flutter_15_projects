import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notice_board/theme.dart';
import 'package:notice_board/ui/routes.dart';
import 'package:notice_board/ui/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
