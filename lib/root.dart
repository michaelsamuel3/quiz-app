import 'package:flutter/material.dart';
import 'package:quizapp/screens/admin.dart';
//import 'package:quizapp/screens/admin.dart';
import 'package:quizapp/screens/login.dart';
import 'package:quizapp/screens/home.dart';
import 'package:quizapp/screens/questionscreen.dart';
import 'package:quizapp/screens/signup.dart';
import 'package:quizapp/screens/spalshscreen.dart';
import 'package:quizapp/utility/routes.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashscreen,
      routes: {
        Routes.splashscreen: (context) => const Splashscreen(),
        Routes.login: (context) => const Login(),
        Routes.signup: (context) => const Signup(),
        Routes.home: (context) => const Home(),
        Routes.questionscreen:(context) => const Questions_screen(),
        Routes.adminscreen:(context) => const Adminscreen()
      },
    );
  }
}
