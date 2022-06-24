import 'package:flutter/material.dart';

class p6 extends StatelessWidget {
  const p6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Layout Flutter by kanokpol wuttisen"),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "What is this picture",
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: Image.network(
                  "https://i.pinimg.com/474x/f8/65/52/f86552ecef0bf955aa6f5b28f32d2925.jpg"),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextBox(
                name: "Work space cafe", color: Colors.brown, answer: false),
            TextBox(
                name: "drink space cafe", color: Colors.blueGrey, answer: false)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextBox(
              name: "Sleep space cafe",
              color: Colors.orange,
              answer: true,
            ),
            TextBox(name: "Eater space cafe", color: Colors.blue, answer: false)
          ])
        ]));
  }
}

class TextBox extends StatefulWidget {
  TextBox(
      {Key? key, required this.name, required this.color, required this.answer})
      : super(key: key);

  String name;
  Color color;
  bool answer;
  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  void CheckChoice() {
    if (widget.answer == true) {
      setState(() {
        widget.color = Colors.green;
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Score!"),
            content: Text("Congrets, you get 1 point."),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Ok"),
              ),
            ],
          ),
        );
      });
    } else {
      setState(() {
        widget.color = Colors.red;
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Score!"),
            content: Text("Sorry, you miss it."),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Ok"),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 50),
      color: widget.color,
      child: InkWell(
        onTap: () {
          CheckChoice();
        },
        child: Text(
          widget.name,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
