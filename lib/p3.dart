import 'package:flutter/material.dart';

class p3 extends StatelessWidget {
  const p3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Pet App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextBorder(
                  name: "jo",
                  color: Colors.green,
                ),
                TextBorder(
                  name: "joey",
                  color: Colors.yellow,
                ),
                TextBorder(
                  name: "jo",
                  color: Colors.red,
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                ImageBox(
                    imagesrc:
                        "https://cdna.artstation.com/p/assets/images/images/037/564/824/large/brandon-mcdonald-memedog2-copy2.jpg?1620717308"),
                ImageBox(
                    imagesrc:
                        "https://p16-sign-va.tiktokcdn.com/tos-maliva-avt-0068/ccb78eab56c38a9684cbca0531e92ade~c5_720x720.jpeg?x-expires=1653980400&x-signature=g%2BaM1RRtjopCOqgyRjrVU3t4mfk%3D"),
                ImageBox(
                    imagesrc:
                        "https://i.pinimg.com/474x/f8/65/52/f86552ecef0bf955aa6f5b28f32d2925.jpg")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextBorder extends StatelessWidget {
  TextBorder({Key? key, required this.name, required this.color})
      : super(key: key);

  String name;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10),
      color: color,
      child: Text(
        name,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  ImageBox({Key? key, required this.imagesrc}) : super(key: key);

  String imagesrc;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 5),
          child: Image.network(imagesrc),
        ),
      ),
    );
  }
}
