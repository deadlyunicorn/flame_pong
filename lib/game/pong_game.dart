import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_pong/enums/difficulty.dart';
import 'package:flame_pong/game/ball.dart';

class PongGame extends FlameGame<World> {
  GameDifficulty difficulty = GameDifficulty.medium;
  late final Ball _ball;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    _ball = Ball()..position = Vector2(size.x / 2, size.y / 2);

    add(_ball);
  }

  void start({
    required GameDifficulty difficulty,
  }) {
    this.difficulty = difficulty;
  }
}
