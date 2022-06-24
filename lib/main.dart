import 'package:flutter/material.dart';

import 'cc-app-tower-box-test/Home_page.dart';

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
