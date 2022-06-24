// import 'package:flutter/material.dart';
//
// class Tower_box_test extends StatefulWidget {
//   const Tower_box_test({Key? key}) : super(key: key);
//
//   @override
//   State<Tower_box_test> createState() => _Tower_box_testState();
// }
//
// class _Tower_box_testState extends State<Tower_box_test> {
//   double _width = 64;
//   bool isTransparent = false;
//   bool isVisible = true;
//   double opacityLevel = 1.0;
//
//   bool selected = false;
//   void _changeOpacity() {
//     setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(bottom: 20),
//               width: 360,
//               color: Color(0xffD8D8D8),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   AnimatedPositioned(
//                     width: selected ? 200.0 : 50.0,
//                     height: selected ? 50.0 : 200.0,
//                     bottom: selected ? 100.0 : 0,
//                     duration: const Duration(seconds: 2),
//                     curve: Curves.fastOutSlowIn,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selected = !selected;
//                         });
//                       },
//                       child: Container(
//                         color: Colors.blue,
//                         child: const Center(child: Text('Tap me')),
//                       ),
//                     ),
//                   ),
//                   // AnimatedPositioned(
//                   //   width: 120,
//                   //   height: 64,
//                   //   duration: const Duration(seconds: 1),
//                   //   child: Container(
//                   //     margin: EdgeInsets.only(bottom: 4),
//                   //     decoration: BoxDecoration(
//                   //         borderRadius: BorderRadius.circular(8.0),
//                   //         border: Border.all(color: Color(0xff707070)),
//                   //         color: Color(0xffcf00ff)),
//                   //   ),
//                   // ),
//                   AnimatedContainer(
//                     duration: const Duration(seconds: 2),
//                     child: Container(
//                       width: 120,
//                       height: 64,
//                       margin: EdgeInsets.only(bottom: 4),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           border: Border.all(color: Color(0xff707070)),
//                           color: Color(0xffF9DFFF)),
//                     ),
//                   ),
//                   AnimatedOpacity(
//                     opacity: isVisible ? 1.0 : 0.0,
//                     duration: const Duration(milliseconds: 500),
//                     child: Container(
//                       width: 120,
//                       height: 64,
//                       margin: EdgeInsets.only(bottom: 4),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           border: Border.all(color: Color(0xff707070)),
//                           color: Color(0xff90E5FF)),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//               width: 360,
//               height: 104,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: 64,
//                     height: 64,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         border: Border.all(color: Color(0xff707070)),
//                         color: Color(0xffF9DFFF)),
//                   ),
//                   GestureDetector(
//                     onTap: () => setState(() => isVisible = !isVisible),
//                     child: Container(
//                       // width: _width,
//                       width: 64,
//                       height: 64,
//                       padding: const EdgeInsets.all(20.0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30.0),
//                           border: Border.all(color: Color(0xff707070)),
//                           color: Color(0xff90E5FF)),
//                     ),
//                   ),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }
