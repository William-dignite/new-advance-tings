import 'package:flutter/material.dart';

class OneView extends StatelessWidget {
  const OneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'One',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        )
      ],
    );
  }
}
