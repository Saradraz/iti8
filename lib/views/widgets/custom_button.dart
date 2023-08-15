// import 'package:flutter/material.dart';

// class mycustombutton extends StatefulWidget {
//   String buttonlable1;
//   void Function()? ontap;
//   mycustombutton({
//     super.key,
//     required this.buttonlable1,
//     required this.ontap,
//   });

//   @override
//   State<mycustombutton> createState() => _mycustombuttonState();
// }

// class _mycustombuttonState extends State<mycustombutton> {
//   @override
//   Widget build(BuildContext context) {
//     return
//      InkWell(
//       onTap:widget.ontap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           width: 250,
//           height: 45,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Center(
//               child: Text(
//             widget.buttonlable1,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }
