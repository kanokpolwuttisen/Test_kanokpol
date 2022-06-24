import 'package:flutter/material.dart';

class GetAnswer extends StatefulWidget {
  GetAnswer({Key? key, required this.image, required this.choice})
      : super(key: key);

  String image;
  String choice;
  @override
  State<GetAnswer> createState() => _GetAnswerState();
}

class _GetAnswerState extends State<GetAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your answer."),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Your picture answer.",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Image.network(widget.image),
          Text("Your choice is ${widget.choice}.",
              style: TextStyle(fontSize: 20, color: Colors.pink))
        ],
      ),
    );
  }
}
