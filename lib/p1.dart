import 'package:flutter/material.dart';

class p1 extends StatelessWidget {
  const p1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Quote"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 110),
                  child: Image.network(
                      "https://quotefancy.com/media/wallpaper/3840x2160/4056-Ernest-Hemingway-Quote-There-is-no-friend-as-loyal-as-a-book.jpg"),
                ),
              )
            ],
          ),
          // Container(
          //   padding: EdgeInsets.all(50),
          //   margin: EdgeInsets.only(left: 80, top: 50),
          //   color: Colors.amber,
          //   child: Text("hello"),
          // ),

          // Row(
          //   children: [
          //     Container(
          //         margin: EdgeInsets.only(
          //             top: 270, left: 60, bottom: 50, right: 40),
          //         child: Text(
          //           "Ernest",
          //           style: TextStyle(
          //               color: Colors.red,
          //               fontSize: 16.0,
          //               fontWeight: FontWeight.bold),
          //         )),
          //     Container(
          //       margin: EdgeInsets.only(
          //           top: 270, left: 60, bottom: 50, right: 40),
          //       child: Text(
          //         "Hemingway",
          //         style: TextStyle(
          //             color: Colors.red,
          //             fontSize: 16.0,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     )
          //   ],
          // ),

          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 150, left: 70),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Text(
                  "Ermest Hemingway",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
