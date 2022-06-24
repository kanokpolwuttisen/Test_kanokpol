import 'package:flutter/material.dart';

class Problem1 extends StatelessWidget {
  const Problem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Problem 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.all(10),
              color: Colors.red,
              child: Image.network(
                  "https://cdn.britannica.com/49/161649-050-3F458ECF/Bernese-mountain-dog-grass.jpg?q=60")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  child: Image.network(
                      "https://cdn.britannica.com/49/161649-050-3F458ECF/Bernese-mountain-dog-grass.jpg?q=60")),
              Text("Doggy")
            ],
          )
        ],
      ),
    );
  }
}
