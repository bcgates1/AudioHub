// import 'package:flutter/material.dart';

// class Data {
//   String label;
//   Color color;

//   Data(this.label, this.color);
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState();
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int? _selectedIndex;
//   final List<Data> _choiceChipsList = [
//     Data("Android", Colors.green),
//     Data("Flutter", Colors.blue),
//     Data("Ios", Colors.deepOrange),
//     Data("Python", Colors.cyan),
//     Data("React", Colors.pink)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Flutter Choice Chip Demo"),
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           backgroundColor: Colors.blueGrey,
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               Image.asset(
//                 "assets/logo.png",
//                 height: 300,
//                 width: 350,
//               ),
//               Wrap(
//                 spacing: 6,
//                 direction: Axis.horizontal,
//                 children: choiceChips(),
//               ),
//             ],
//           ),
//         ));
//   }

//   List<Widget> choiceChips() {
//     List<Widget> chips = [];
//     for (int i = 0; i < _choiceChipsList.length; i++) {
//       Widget item = Padding(
//         padding: const EdgeInsets.only(left: 10, right: 5),
//         child: ChoiceChip(
//           label: Text(_choiceChipsList[i].label),
//           labelStyle: const TextStyle(color: Colors.white),
//           backgroundColor: _choiceChipsList[i].color,
//           selected: _selectedIndex == i,
//           selectedColor: Colors.black,
//           onSelected: (bool value) {
//             setState(() {
//               _selectedIndex = i;
//             });
//           },
//         ),
//       );
//       chips.add(item);
//     }
//     return chips;
//   }
// }
