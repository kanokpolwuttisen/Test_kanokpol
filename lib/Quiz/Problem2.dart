import 'package:flutter/material.dart';

class Problem2 extends StatelessWidget {
  const Problem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Problem2"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CatBox(
                      numberCat: "Cat 1",
                      choice1: "Momo",
                      choice2: "Jibi",
                      imageCat:
                          "https://i.pinimg.com/736x/ab/9e/53/ab9e53b748f4a45b1aaad922d0788d54.jpg",
                      colorChoice1: Colors.red,
                      colorChoice2: Colors.green,
                      colorNumberCat: Colors.blue),
                ),
                Expanded(
                  child: CatBox(
                      numberCat: "Cat 1",
                      choice1: "Momo",
                      choice2: "Jibi",
                      imageCat:
                          "https://i.pinimg.com/originals/d5/6a/f7/d56af787f81df07a9d5bcd8ecad7ff3f.jpg",
                      colorChoice1: Colors.blue,
                      colorChoice2: Colors.orange,
                      colorNumberCat: Colors.greenAccent),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CatBox(
                      numberCat: "Cat 1",
                      choice1: "Momo",
                      choice2: "Jibi",
                      imageCat:
                          "https://i.ytimg.com/vi/Zr-qM5Vrd0g/maxresdefault.jpg",
                      colorChoice1: Colors.pink,
                      colorChoice2: Colors.black,
                      colorNumberCat: Colors.purpleAccent),
                ),
                Expanded(
                  child: CatBox(
                      numberCat: "Cat 1",
                      choice1: "Momo",
                      choice2: "Jibi",
                      imageCat:
                          "https://pbs.twimg.com/media/FD-Y3soVEAE9Sjj.jpg",
                      colorChoice1: Colors.green,
                      colorChoice2: Colors.red,
                      colorNumberCat: Colors.yellow),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CatBox extends StatelessWidget {
  CatBox(
      {Key? key,
      required this.numberCat,
      required this.choice1,
      required this.choice2,
      required this.imageCat,
      required this.colorChoice1,
      required this.colorChoice2,
      required this.colorNumberCat})
      : super(key: key);

  String numberCat;
  Color colorNumberCat;
  String choice1;
  Color colorChoice1;
  String choice2;
  Color colorChoice2;
  String imageCat;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 175,
      // height: 175,
      // margin: EdgeInsets.all(5),
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
            color: colorNumberCat,
            child: Text(numberCat),
          ),
          Container(
            child: Image.network(imageCat),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                choice1,
                style: TextStyle(fontSize: 16, color: colorChoice1),
              ),
              Text(choice2, style: TextStyle(fontSize: 16, color: colorChoice2))
            ],
          )
        ],
      ),
    );
  }
}
