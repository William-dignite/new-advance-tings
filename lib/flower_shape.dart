// import 'dart:ui';
// import 'package:flutter/material.dart';

// class FlowerShapeWithBlur extends StatelessWidget {
//   const FlowerShapeWithBlur({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final petalWidth = size.width * 0.3; // Width of each petal
//     final petalHeight = size.height * 0.12; // Height of each petal

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Creating 10 petals with blur and transparency
//             for (int i = 0; i < 10; i++)
//               Transform.rotate(
//                 angle: i * 3.14 / 5, // Distribute petals evenly
//                 child: Petal(
//                   width: petalWidth,
//                   height: petalHeight,
//                   blurAmount: 8.0, // Blur effect for each petal
//                   color:
//                       Colors.pinkAccent.withOpacity(0.5), // Adjust transparency
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Petal extends StatelessWidget {
//   final double width;
//   final double height;
//   final double blurAmount;
//   final Color color;

//   const Petal({
//     required this.width,
//     required this.height,
//     required this.blurAmount,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       child: ClipOval(
//         // Create an elliptical petal shape
//         child: Stack(
//           children: [
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
//               child: Container(
//                 width: width,
//                 height: height,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   color: color, // Set the petal color and transparency
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: FlowerShapeWithBlur()));
