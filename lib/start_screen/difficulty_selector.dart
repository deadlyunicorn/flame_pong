import 'package:flame_pong/enums/difficulty.dart';
import 'package:flutter/material.dart';

class DifficultySelector extends StatelessWidget {
  DifficultySelector({
    required this.selectedDifficulty,
    required this.decreaseDifficulty,
    required this.increaseDifficulty,
  });
  final GameDifficulty selectedDifficulty;
  final void Function() decreaseDifficulty;
  final void Function() increaseDifficulty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Difficulty: ${selectedDifficulty.name}",
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Center(
              child: SizedBox(
                width: 128,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    (selectedDifficulty.index > 0)
                        ? TextButton(
                            onPressed: decreaseDifficulty,
                            child: const Text("<"),
                          )
                        : const SizedBox.shrink(),
                    (selectedDifficulty.index <
                            GameDifficulty.values.length - 1)
                        ? TextButton(
                            onPressed: increaseDifficulty,
                            child: const Text(">"),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
