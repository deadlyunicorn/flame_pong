import 'package:flame_pong/enums/enums.dart';
import 'package:flame_pong/game/pong_game.dart';
import 'package:flame_pong/start_screen/difficulty_selector.dart';
import 'package:flame_pong/start_screen/title.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.game);
  final PongGame game;

  static const String overlayName = "startScreen";
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  GameDifficulty difficulty = GameDifficulty.medium;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height / 10,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const GameTitle(),
            SizedBox.square(
              dimension: MediaQuery.sizeOf(context).height / 10,
            ),
            TextButton(
              onPressed: () {
                widget.game.overlays.remove(StartScreen.overlayName);
                widget.game.start(
                  difficulty: difficulty,
                );
              },
              child: const Text("Start Game"),
            ),
            DifficultySelector(
              selectedDifficulty: difficulty,
              toggleDifficulty: toggleDifficulty,
            ),
          ],
        ),
      ),
    );
  }

  void toggleDifficulty() {
    if (difficulty.index < GameDifficulty.values.length - 1) {
      setState(() {
        difficulty = GameDifficulty.values[difficulty.index + 1];
      });
    } else {
      setState(() {
        difficulty = GameDifficulty.values[0];
      });
    }
  }
}
