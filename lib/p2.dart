import 'package:flutter/material.dart';

class p2 extends StatelessWidget {
  const p2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 15),
                  child: Text("kanokpol wuttisen",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "613040158-8",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 15),
                  child: Text(
                    "Photo credit",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "peeraphat",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            // margin: EdgeInsets.only(top: 110),
            child: Image.network(
                "https://pix10.agoda.net/hotelImages/951189/-1/a3ab86fcd2d8942c27e40e8fc5601663.jpg?ca=9&ce=1&s=1024x768"),
          ),
          Container(
            child: RaisedButton(
              child: Text('Show alert'),
              onPressed: () {
                showAlertDialog(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmation"),
    content: Text("Submitting infomation."),
    actions: [
      ElevatedButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
