import 'package:flutter/material.dart';
import 'package:kanokpol_android/Home.dart';
import 'package:kanokpol_android/Quiz/Problem1.dart';
import 'package:kanokpol_android/Quiz/Problem3.dart';
import 'package:kanokpol_android/p1.dart';
import 'package:kanokpol_android/p2.dart';
import 'package:kanokpol_android/p3.dart';
import 'package:kanokpol_android/p4.dart';
import 'package:kanokpol_android/p5.dart';
import 'package:kanokpol_android/p6.dart';
import 'package:kanokpol_android/p7.dart';
import 'package:kanokpol_android/Quiz/HomeQuiz.dart';

import 'Quiz/Problem2.dart';
import 'Quiz/Problem4.dart';
import 'cc-app-tower-box-test/Home_page.dart';
import 'cc-app-tower-box-test/test.dart';
import 'cc-app-tower-box-test/tset_bottom_pressed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/home': (context) => const HomeQuiz(),
        '/home': (context) => Tower_box_test(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/Problem1': (context) => const Problem1(),
        // '/Problem2': (context) => const Problem2(),
        // '/Problem3': (context) => const Problem3(),
        // '/Problem4': (context) => const Problem4(),
        // '/GetPicture': (context) => const GetPicture(),
      },
    );
    // theme: ThemeData(
    //   primarySwatch: Colors.blue,
    // ),
    // home: p6());
  }
}
