import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kanokpol_android/p6.dart';

class QuestionOrder {
  int questionNumber;
  String image;
  String choice1;
  String choice2;
  String choice3;
  String choice4;
  bool visiblePrivious;
  bool visibleNext;

  QuestionOrder(
      {required this.questionNumber,
      required this.image,
      required this.choice1,
      required this.choice2,
      required this.choice3,
      required this.choice4,
      required this.visiblePrivious,
      required this.visibleNext});
}

class Problem4 extends StatefulWidget {
  const Problem4({Key? key}) : super(key: key);
  @override
  State<Problem4> createState() => _Problem4State();
}

class _Problem4State extends State<Problem4> {
  @override
  Widget build(BuildContext context) {
    return QuestionTemplate();
  }
}

class QuestionTemplate extends StatefulWidget {
  QuestionTemplate({Key? key}) : super(key: key);

  List<QuestionOrder> questionOrder = [
    QuestionOrder(
      questionNumber: 1,
      image:
          "https://i.pinimg.com/474x/f8/65/52/f86552ecef0bf955aa6f5b28f32d2925.jpg",
      choice1: "Work space cafe",
      choice2: "drink space cafe",
      choice3: "Sleep space cafe",
      choice4: "Eater space cafe",
      visiblePrivious: false,
      visibleNext: true,
    ),
    QuestionOrder(
      questionNumber: 2,
      image:
          "https://i.pinimg.com/474x/f8/65/52/f86552ecef0bf955aa6f5b28f32d2925.jpg",
      choice1: "aaaaaaaaaaaaaaaaa",
      choice2: "aaaaaaaaaaaaa",
      choice3: "aaaaaaaa",
      choice4: "aaaaa",
      visiblePrivious: true,
      visibleNext: true,
    ),
    QuestionOrder(
      questionNumber: 3,
      image:
          "https://i.pinimg.com/474x/f8/65/52/f86552ecef0bf955aa6f5b28f32d2925.jpg",
      choice1: "bbbbbbbbbbbbbbbb",
      choice2: "bbbbbbbbbbbb",
      choice3: "bbbbbbbb",
      choice4: "bbbbb",
      visiblePrivious: true,
      visibleNext: false,
    )
  ];

  @override
  State<QuestionTemplate> createState() => _QuestionTemplateState();
}

class _QuestionTemplateState extends State<QuestionTemplate> {
  int i = 0;
  void NaxtChoice() {
    if (0 <= i && i < widget.questionOrder.length) {
      i++;
      setState(() {
        QuestionTemplate();
      });
    } else if (i == widget.questionOrder.length) {
      setState(() {
        QuestionTemplate();
      });
    }
  }

  void PreviousChoice() {
    if (0 <= i && i < widget.questionOrder.length) {
      i--;
      setState(() {
        QuestionTemplate();
      });
    } else if (i == 0) {
      setState(() {
        QuestionTemplate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Question ${widget.questionOrder[i].questionNumber}"),
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
            child: Image.network(widget.questionOrder[i].image),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextBox(
                name: widget.questionOrder[i].choice1,
                color: Colors.brown,
                answer: false),
            TextBox(
                name: widget.questionOrder[i].choice2,
                color: Colors.blueGrey,
                answer: false)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextBox(
              name: widget.questionOrder[i].choice3,
              color: Colors.orange,
              answer: true,
            ),
            TextBox(
                name: widget.questionOrder[i].choice4,
                color: Colors.blue,
                answer: false)
          ]),
          Container(
            padding: EdgeInsets.all(10),
            // color: Colors.red,
            // decoration: BoxDecoration(color: Colors.redAccent),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: widget.questionOrder[i].visiblePrivious,
                  child: ElevatedButton(
                    onPressed: () {
                      PreviousChoice();
                    },
                    child: Text(
                      "PRIVIOUS",
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.questionOrder[i].visibleNext,
                  child: ElevatedButton(
                    onPressed: () {
                      NaxtChoice();
                    },
                    child: Text("NEXT"),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
