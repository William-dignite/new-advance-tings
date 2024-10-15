import 'package:flutter/material.dart';

class FadingTextItem extends StatelessWidget {
  final Widget childToShade;

  const FadingTextItem({super.key, required this.childToShade});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          end: const Alignment(0.0,
              0.1), // Adjust the end point to cover less space at the bottom
          colors: [
            const Color(0xffF4F4F4).withOpacity(0.0),
            const Color(0xffF7F7F7).withOpacity(0.25),
            Colors.white,
          ],
          // stops: const [
          //   0.0,
          //   23.0,
          //   100,
          // ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), child: childToShade),
    );
  }
}
