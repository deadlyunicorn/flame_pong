import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_pong/enums/difficulty.dart';
import 'package:flame_pong/game/ball.dart';
import 'package:flame_pong/game/goal_tracker.dart';
import 'package:flame_pong/game/slider.dart';

// ignore: always_specify_types
class PongGame extends FlameGame<World> with HasCollisionDetection {
  //TODO: Add pan detector for mobiles.

  GameDifficulty difficulty = GameDifficulty.medium;
  bool isPlaying = false;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    add(Ball());
  }

  void start({
    required GameDifficulty difficulty,
  }) {
    this.difficulty = difficulty;
    isPlaying = true;
    add(Ball());
    add(GoalTracker.top());
    add(GoalTracker(isBottom: true));
    add(Slider.top());
    add(Slider(isBottom: true));
  }
}
