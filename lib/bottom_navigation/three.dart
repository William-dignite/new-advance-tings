import 'package:flutter/material.dart';

class ThreeView extends StatelessWidget {
  const ThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Three',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        )
      ],
    );
  }
}
