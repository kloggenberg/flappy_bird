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
      child: Container(
        width: 60,
        height: pipeHeight,
        color: Colors.green,
      ),
    );
  }
}
