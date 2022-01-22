import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'screens/view_noted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      },
      initialRoute: 'signin',
    );
  }
}
