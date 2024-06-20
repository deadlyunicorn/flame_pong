import 'package:flame_pong/enums/difficulty.dart';
import 'package:flutter/material.dart';

class DifficultySelector extends StatelessWidget {
  DifficultySelector({
    required this.selectedDifficulty,
    required this.toggleDifficulty,
  });
  final GameDifficulty selectedDifficulty;
  final void Function() toggleDifficulty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              bottom: -8,
              child: Transform.rotate(
                angle: -0.04,
                child: Text(
                  "Press to change",
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: toggleDifficulty,
              child: const Text("Difficulty"),
            ),
          ],
        ),
        SizedBox(
          width: 248,
          child: Text(
            ": ${selectedDifficulty.name}",
          ),
        ),
      ],
    );
  }
}
