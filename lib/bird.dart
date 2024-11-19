import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final double yPosition;

  const Bird({super.key, required this.yPosition});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment(0, yPosition),
      duration: const Duration(milliseconds: 0),
      child: Image.asset(
        'assets/images/yellowbird-midflap.png', // Bird image
        width: 50,
        height: 50,
      ),
    );
  }
}
