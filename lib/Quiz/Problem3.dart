import 'package:flutter/material.dart';
import 'package:kanokpol_android/Quiz/AnswerPage.dart';

class Problem3 extends StatelessWidget {
  const Problem3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Problem 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Where is this panda.",
            style: TextStyle(fontSize: 24, color: Colors.pink),
          ),
          Row(
            children: [
              ChoiceBox(
                image:
                    "https://img-16.stickers.cloud/packs/f1569cfb-7250-48fd-abad-1b8ea12453b2/webp/a437e0c4-cc62-440b-bf3d-8d5ef6c18cd5.webp",
                color: Colors.blue,
                answer: false,
                choice: "A",
              ),
              ChoiceBox(
                image:
                    "https://i.pinimg.com/originals/a5/4e/54/a54e5433c1596e1ab5e85c622cd492b9.jpg",
                color: Colors.purpleAccent,
                answer: true,
                choice: "B",
              ),
              ChoiceBox(
                image:
                    "https://p16-sign.tiktokcdn-us.com/tos-useast5-avt-0068-tx/eae918d9332d085ff877e5a1764af22f~c5_720x720.jpeg?x-expires=1654084800&x-signature=ybYRPq4%2BT3qMjHjsfJyBjtfuw0A%3D",
                color: Colors.deepOrange,
                answer: false,
                choice: "C",
              ),
              ChoiceBox(
                image:
                    "https://pbs.twimg.com/profile_images/1221350010295480320/3RXkSArg_400x400.jpg",
                color: Colors.brown,
                answer: false,
                choice: "D",
              )
            ],
          )
        ],
      ),
    );
  }
}

class ChoiceBox extends StatefulWidget {
  ChoiceBox(
      {Key? key,
      required this.image,
      required this.color,
      required this.answer,
      required this.choice})
      : super(key: key);

  String image;
  Color color;
  String choice;
  bool answer;
  @override
  State<ChoiceBox> createState() => _ChoiceBoxState();
}

class _ChoiceBoxState extends State<ChoiceBox> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      "Ok",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetAnswer(
                                  image: widget.image, choice: widget.choice)));
                    },
                    child: Text("Next page"),
                  ),
                ],
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
            title: Text("Wrong!!!"),
            content: Text("You got 0 score."),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      "Ok",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetAnswer(
                                  image: widget.image, choice: widget.choice)));
                    },
                    child: Text("Next page"),
                  ),
                ],
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Image.network(widget.image),
        ElevatedButton(
            onPressed: () {
              CheckChoice();
            },
            style: ElevatedButton.styleFrom(
              primary: widget.color,
            ),
            child: Text(widget.choice))
      ],
    ));
  }
}
