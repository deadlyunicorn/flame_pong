import 'package:flame_pong/enums/difficulty.dart';
import 'package:flame_pong/start_screen/difficulty_selector.dart';
import 'package:flame_pong/start_screen/title.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen();

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  GameDifficulty difficulty = GameDifficulty.medium;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const GameTitle(),
             SizedBox.square(
              dimension: MediaQuery.sizeOf(context).height/10,
            ),
            DifficultySelector(
              selectedDifficulty: difficulty,
              decreaseDifficulty: decreaseDifficulty,
              increaseDifficulty: increaseDifficulty,
            ),
          ],
        ),
      ),
    );
  }

  void decreaseDifficulty() {
    if (difficulty.index > 0) {
      setState(() {
        difficulty = GameDifficulty.values[difficulty.index - 1];
      });
    }
  }

  void increaseDifficulty() {
    if (difficulty.index < GameDifficulty.values.length - 1) {
      setState(() {
        difficulty = GameDifficulty.values[difficulty.index + 1];
      });
    }
  }
}
