import 'package:flutter/material.dart';

class p5 extends StatefulWidget {
  const p5({Key? key}) : super(key: key);

  @override
  State<p5> createState() => _p5State();
}

class _p5State extends State<p5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text on press"),
      ),
      body: Column(
        children: [
          Star(
            icon: Icon(Icons.star_outline),
          )
        ],
      ),
    );
  }
}

class Star extends StatefulWidget {
  Star({Key? key, required this.icon}) : super(key: key);
  Icon icon;
  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  bool Tap = false;
  void TapStar() {
    if (Tap == false) {
      setState(() {
        widget.icon = Icon(Icons.star);
        Tap = true;
      });
    } else {
      setState(() {
        widget.icon = Icon(Icons.star_outline);
        Tap = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          TapStar();
        },
        icon: (widget.icon));
  }
}
