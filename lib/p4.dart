import 'package:flutter/material.dart';

class p4 extends StatelessWidget {
  const p4({Key? key}) : super(key: key);

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
            TextBox(name: "Work space cafe", color: Colors.red),
            TextBox(name: "drink space cafe", color: Colors.green)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextBox(name: "Sleep space cafe", color: Colors.orange),
            TextBox(name: "Eater space cafe", color: Colors.blue)
          ])
        ]));
  }
}

class TextBox extends StatefulWidget {
  TextBox({Key? key, required this.name, required this.color})
      : super(key: key);

  String name;
  Color color;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 50),
      color: widget.color,
      child: Text(
        widget.name,
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
