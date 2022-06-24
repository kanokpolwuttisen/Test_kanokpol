import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 230),
                child: Image.network(
                    "https://www.trending.nl/wp-content/uploads/2021/08/quiz-1920x1509.jpg"),
              ),
              Container(
                child: Text(
                  "Welcome to Quiz App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "By Kanokpol Wuttisen 613040158-8",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              )
            ],
          ),
          Container(
            // margin: EdgeInsets.only(top: 200),
            child: ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Start'),
            ),
          )
        ],
      ),
    );
  }
}
