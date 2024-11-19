import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  final double pipeX;
  final double pipeHeight;
  final bool isBottomPipe;

  const Pipe({super.key, required this.pipeX, required this.pipeHeight, required this.isBottomPipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(pipeX, isBottomPipe ? 1 : -1),
      child: Image.asset(
        'assets/images/pipe-green.png', // Pipe image
        width: 60,
        height: pipeHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
