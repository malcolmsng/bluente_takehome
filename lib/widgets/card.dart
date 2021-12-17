// import 'package:flutter/material.dart';

// class QuestionCard extends StatefulWidget {
//   final String img;
//   final String text;
//   final bool correct;

//   const QuestionCard(
//       {Key? key, required this.img, required this.text, this.correct = false})
//       : super(key: key);

//   @override
//   _QuestionCardState createState() => _QuestionCardState();
// }

// class _QuestionCardState extends State<QuestionCard> {
//   bool pressed = false;
//   var boxColour = Colors.grey[200];

//   Widget build(BuildContext context) {
    
//   }

//   void answer() {
//     setState(() {
//       boxColour = !pressed
//           ? (!widget.correct ? Colors.redAccent : Colors.greenAccent)
//           : null;
//     });
//   }
// }
