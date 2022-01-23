import 'package:flutter/material.dart';
import 'package:flutter_project/screens/start.dart';

import 'screens/home.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'screens/view_noted.dart';
import 'screens/info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'signup': (context) => SignUp(),
        'signin': (context) => SignIn(),
        'viewnoted': (context) => ViewNoted(),
        'home': (context) => Home(),
        'start': (context) => Start(),
        'info': (context) => Info(),
      },
      initialRoute: 'start',
    );
  }
}
