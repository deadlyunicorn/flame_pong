import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_pong/enums/difficulty.dart';

class PongGame extends FlameGame<World> {
  late GameDifficulty difficulty;

  void start({
    required GameDifficulty difficulty,
  }) {
    this.difficulty = difficulty;
  }
}
