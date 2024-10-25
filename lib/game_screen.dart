import 'dart:async';
import 'package:flutter/material.dart';
import 'bird.dart';
import 'pipe.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Bird and game variables
  static double birdY = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdY;
  
  // Pipe variables
  double pipeX = 1;
  
  // Game state flags
  bool gameHasStarted = false;
  bool isGameOver = false;

  // Bird jump function
  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdY;
    });
  }

  // Start game function
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;  // Simple jump physics formula

      setState(() {
        birdY = initialHeight - height;
        pipeX -= 0.05;  // Move the pipes to the left
      });

      // Reset pipe position when off-screen
      if (pipeX < -1.5) {
        pipeX = 1.5;
      }

      // Check for game over (bird hits ground or goes off-screen)
      if (birdY > 1 || birdY < -1) {
        timer.cancel();
        isGameOver = true;
      }
    });
  }

  // Reset the game
  void resetGame() {
    setState(() {
      birdY = 0;
      time = 0;
      height = 0;
      initialHeight = birdY;
      pipeX = 1;
      isGameOver = false;
      gameHasStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Tap to either jump or restart based on game state
      onTap: isGameOver ? resetGame : (gameHasStarted ? jump : startGame),
      child: Stack(
        children: [
          // Bird widget
          Bird(yPosition: birdY),

          // Pipe widgets
          Pipe(pipeX: pipeX, pipeHeight: 200.0, isBottomPipe: false),
          Pipe(pipeX: pipeX, pipeHeight: 200.0, isBottomPipe: true),

          // "Game Over" screen overlay
          if (isGameOver)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Game Over',
                    style: TextStyle(fontSize: 32, color: Colors.red),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tap to Restart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
