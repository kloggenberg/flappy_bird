import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() => runApp(FlappyBirdApp());

class FlappyBirdApp extends StatelessWidget {
  const FlappyBirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flappy Bird Clone',
      home: GameScreen(),
    );
  }
}
