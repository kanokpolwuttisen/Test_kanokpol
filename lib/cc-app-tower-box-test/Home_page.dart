import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedListSample());
}

class AnimatedListSample extends StatefulWidget {
  const AnimatedListSample({Key? key}) : super(key: key);

  @override
  State<AnimatedListSample> createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  late List<int> numList = [];
  int? _selectedItem;
  late int
      _nextItem; // The next item inserted when the user presses the '+' button.
  late int _removeItem;
  int min = 1, max = 3;
  late int num;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 11; i++) {
      num = min + Random().nextInt(max - min);
      if (i == 9) {
        numList.add(3);
      } else if (i == 10) {
        numList.add(0);
      } else {
        if (num == 1) {
          numList.add(1);
        } else if (num == 2) {
          numList.add(2);
        }
      }
      print(numList);
      print(numList.length);
    }

    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: numList,
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 10;
    _removeItem = 0;
    print(_list);
    print(_list.length);

    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (_) => FunkyOverlay(
            text: "กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย block"),
      );
    });
  }

  late Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _start++;
        });
      },
    );
  }

  // int = 1 is Color(0xffF9DFFF), int = 2 is Color(0xff90E5FF)
  int tap = 0;
  int _counter = 0;
  bool _buttonPressed = false;
  bool _loopActive = false;
  bool _dialogActive = true;
  void _increaseCounterWhilePressed(String button) async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      print(_counter);
      // do your thing
      if (_counter == 2) {
        if (tap == 0) {
          startTimer();
          tap++;
        }
        if (_list[0] == 3 && button == "center") {
          setState(() {
            // isVisible = !isVisible;
            // selected = !selected;
            _counter = 0;
            // i++;
            _remove();
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
            print(_list);
          });
          break;
        }
        if (_list[0] == 1 && button == "left") {
          setState(() {
            // isVisible = !isVisible;
            // selected = !selected;
            _counter = 0;
            // i++;
            _remove();
            print("left");
            print(_list);
          });
        }
        if (_list[0] == 2 && button == "right") {
          setState(() {
            // isVisible = !isVisible;
            // selected = !selected;
            _counter = 0;
            // i++;
            _remove();
            print("right");
            print(_list);
          });
        }
      } else {
        setState(() {
          _counter++;
          // Tower_Box.remove(Tower_Box[0]);
          // i++;
        });
      }
      if (_list.length == 2 && _dialogActive) {
        setState(() {
          Future.delayed(Duration.zero, () {
            showDialog(
              context: context,
              builder: (_) => FunkyOverlay(
                  text: "กดสองปุ่ม ค้างไว้ 2 วินาทีเพื่อทำลาย block"),
            );
          });
          _dialogActive = !_dialogActive;
          _counter = 0;
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

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This
  // method is needed because a removed item remains visible until its
  // animation has completed (even though it's gone as far this ListModel is
  // concerned). The widget will be used by the
  // [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    final int randomNum;
    randomNum = min + Random().nextInt(max - min);
    _list.insert(index, randomNum);
  }

  // Remove the selected item from the list model.
  void _remove() {
    _list.removeAt(0);
    print(_list.length);
    print(_list[0]);
    setState(() {
//         _selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Stack(children: [
                SizedBox(
                  child: AnimatedList(
                    key: _listKey,
                    reverse: true,
                    initialItemCount: _list.length,
                    itemBuilder: _buildItem,
                  ),
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
              ]),
            ),
            Container(
                // width: 360,
                height: 104,
                color: const Color(0xffD8D8D8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        margin: EdgeInsets.all(7),
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
      ),
    );
  }
}

typedef RemovedItemBuilder<T> = Widget Function(
    T item, BuildContext context, Animation<double> animation);

/// Keeps a Dart [List] in sync with an [AnimatedList].
///
/// The [insert] and [removeAt] methods apply to both the internal list and
/// the animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that
/// mutate the list must make the same changes to the animated list in terms
/// of [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
    print(_items);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value.
///
/// The text is displayed in bright green if [selected] is
/// true. This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  })  : assert(item >= 0),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return item == 3
        ? SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: Transform.rotate(
                angle: 45 * (pi / 180),
                child: Container(
                  margin: EdgeInsets.only(bottom: 30, top: 30),
                  color: const Color(0xffD27AFF),
                  width: 120,
                  height: 120,
                ),
              ),
            ),
          )
        : item == 0
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(left: 120, right: 120),
                child: SizeTransition(
                  sizeFactor: animation,
                  child: SizedBox(
                      height: 64.0,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: const Color(0xff707070)),
                          color: item == 1
                              ? const Color(0xffF9DFFF)
                              : const Color(0xff90E5FF),
                        ),
                      )),
                ),
              );
  }
}

class FunkyOverlay extends StatefulWidget {
  FunkyOverlay({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}
