import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

// class Widget_Box_Color {
//   Color color;
//   Widget_Box_Color({
//     required this.color,
//   });
// }

class Tower_box_test extends StatefulWidget {
  Tower_box_test({Key? key}) : super(key: key);

  @override
  State<Tower_box_test> createState() => _Tower_box_testState();
}

class _Tower_box_testState extends State<Tower_box_test> {
  double _width = 64;
  bool isTransparent = false;
  bool isVisible = true;
  double opacityLevel = 1.0;
  bool selected = true;

  int _counter = 0;
  bool _buttonPressed = false;
  bool _loopActive = false;

  List<Color> Tower_Box = [];
  @override
  void initState() {
    int numColor;
    Color colorOne = const Color(0xffF9DFFF);
    Color colorTwo = const Color(0xff90E5FF);
    var min = 1;
    var max = 3;
    for (var i = 0; i < 11; i++) {
      numColor = min + Random().nextInt(max - min);
      if (i == 10) {
        Tower_Box.add(Colors.purple);
      } else {
        if (numColor == 1) {
          Tower_Box.add(colorOne);
        } else {
          Tower_Box.add(colorTwo);
        }
        print(Tower_Box[i]);
        print(Tower_Box.length);
      }
    }

    super.initState();
  }

  late Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _start++;
        });
      },
    );
  }

  int i = 0;
  int tap = 0;
  void _increaseCounterWhilePressed(String button) async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      if (_counter == 2) {
        if (tap == 0) {
          startTimer();
          tap++;
        }
        if (button == "center" && Tower_Box[0] == Colors.purple) {
          setState(() {
            // isVisible = !isVisible;
            // selected = !selected;
            _counter = 0;
            // i++;
            Tower_Box.remove(Tower_Box[0]);
            setState(() {
              _timer.cancel();
            });
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Total time'),
                content: Text('$_start s'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );

            print("left");
            print(Tower_Box.length);
          });
        }
        if (Tower_Box[0] == const Color(0xffF9DFFF) && button == "left") {
          setState(() {
            // isVisible = !isVisible;
            // selected = !selected;
            _counter = 0;
            // i++;
            Tower_Box.remove(Tower_Box[0]);
            print("left");
            print(Tower_Box.length);
          });
        }
        if (Tower_Box[0] == const Color(0xff90E5FF) && button == "right") {
          setState(() {
            // isVisible = !isVisible;
            // selected = !selected;
            _counter = 0;
            // i++;
            Tower_Box.remove(Tower_Box[0]);
            print("right");
            print(Tower_Box.length);
          });
        }
      } else {
        setState(() {
          _counter++;
          // Tower_Box.remove(Tower_Box[0]);
          // i++;
        });
      }

      // wait a bit
      await Future.delayed(Duration(milliseconds: 500));
    }

    _loopActive = false;
  }

  void _resetCounter() {
    // make sure that only one loop is active
    setState(() {
      _counter = 0;
    });
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: 360,
                  color: const Color(0xffD8D8D8),
                  child: Stack(alignment: Alignment.center, children: [
                    ListView.builder(
                      reverse: true,
                      itemCount: Tower_Box.length,
                      itemBuilder: (context, index) {
                        return AnimatedPositioned(
                            bottom:
                                selected ? 68.0 * index : (68.0 * (index - 1)),
                            duration: const Duration(milliseconds: 500),
                            child: index == Tower_Box.length - 1
                                ? Center(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 35),
                                      // width: 100,
                                      // height: 100,
                                      child: Stack(
                                        children: [
                                          Transform.rotate(
                                            angle: 45 * (pi / 180),
                                            child: Container(
                                              color: Tower_Box[index],
                                              width: 170,
                                              height: 170,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 60,
                                    height: 64,
                                    margin: const EdgeInsets.only(
                                        left: 100, right: 100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: Tower_Box[index],
                                    ),
                                  ));
                      },
                    ),
                  ]),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.only(top: 50),
                  child: Text("Couter press on button : $_counter"),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.only(top: 150),
                  child: Text("Total Time :\n $_start s"),
                )
              ],
            ),
          ),
          Container(
              width: 360,
              height: 104,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Listener(
                    onPointerDown: (details) {
                      _buttonPressed = true;
                      _increaseCounterWhilePressed("left");
                    },
                    onPointerUp: (details) {
                      _buttonPressed = false;
                      _resetCounter();
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: const Color(0xff707070)),
                          color: const Color(0xffF9DFFF)),
                    ),
                  ),
                  Listener(
                    onPointerDown: (details) {
                      _buttonPressed = true;
                      _increaseCounterWhilePressed("center");
                    },
                    onPointerUp: (details) {
                      _buttonPressed = false;
                      _resetCounter();
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(30.0),
                          // border: Border.all(color: const Color(0xff707070)),
                          ),
                    ),
                  ),
                  Listener(
                    onPointerDown: (details) {
                      _buttonPressed = true;
                      _increaseCounterWhilePressed("right");
                    },
                    onPointerUp: (details) {
                      _buttonPressed = false;
                      _resetCounter();
                    },
                    child: Container(
                      // width: _width,
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: const Color(0xff707070)),
                          color: const Color(0xff90E5FF)),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class AnimatedBox extends StatefulWidget {
  AnimatedBox(
      {Key? key,
      required this.index,
      required this.color,
      required this.selected})
      : super(key: key);

  int index;
  Color color;
  bool selected;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        width: 120,
        height: 64,
        bottom:
            widget.selected ? 68.0 * widget.index : (68.0 * (widget.index - 1)),
        duration: const Duration(milliseconds: 500),
        child: Container(
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: const Color(0xff707070)),
            color: widget.color,
          ),
        ));
  }
}

// onTap: () {
// print("Touching");
// setState(() {
// // if (false) {
// isVisible = !isVisible;
// selected = !selected;
// // }
// });
// },
