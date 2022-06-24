import 'package:flutter/material.dart';
import 'package:kanokpol_android/Quiz/Problem4.dart';

class HomeQuiz extends StatelessWidget {
  const HomeQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Quiz"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/Problem1');
                },
                child: const Text('Go to Problem 1'),
              ),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/Problem2');
                },
                child: const Text('Go to Problem 2'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quiz",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Image.network(
                    "https://i.pinimg.com/474x/f8/65/52/f86552ecef0bf955aa6f5b28f32d2925.jpg"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/Problem3');
                },
                child: const Text('Go to Problem 3'),
              ),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  Navigator.pushNamed(context, '/Problem4');
                },
                child: const Text('Go to Problem 4'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
