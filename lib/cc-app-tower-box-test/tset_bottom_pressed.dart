import 'package:flutter/material.dart';

class pressed extends StatefulWidget {
  const pressed({Key? key}) : super(key: key);

  @override
  State<pressed> createState() => _pressedState();
}

class _pressedState extends State<pressed> {
  int _counter = 0;

  bool _buttonPressed = false;
  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      if (_counter == 2) {
        setState(() {
          _counter = 0;
        });
      } else {
        setState(() {
          _counter++;
        });
      }

      // wait a bit
      await Future.delayed(Duration(milliseconds: 1000));
    }

    _loopActive = false;
  }

  void _resetCounter() {
    // make sure that only one loop is active
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Listener(
              onPointerDown: (details) {
                _buttonPressed = true;
                _increaseCounterWhilePressed();
              },
              onPointerUp: (details) {
                _buttonPressed = false;
                _resetCounter();
              },
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.orange, border: Border.all()),
                padding: EdgeInsets.all(16.0),
                child: Text('Value: $_counter'),
              ),
            ),
          ),
          Text('Value: $_counter')
        ],
      ),
    );
  }
}
