import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame_pong/enums/enums.dart';
import 'package:flame_pong/game/pong_game.dart';

// ignore: always_specify_types
class Score extends TextComponent with HasGameReference<PongGame> {
  bool isTop;

  Score({
    required this.isTop,
  });

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    if (isTop) {
      text = "Player1: ${game.topPlayerScore}";
      anchor = Anchor.centerLeft;
      position = Vector2(16, game.size.y / 2);
    } else {
      text = "Player2: ${game.bottomPlayerScore}";
      position = Vector2(game.size.x - 16, game.size.y / 2);
      anchor = Anchor.centerRight;
    }
  }

  @override
  void update(double dt) {
    if (game.gameStatus == GameStatus.waiting) {
      removeFromParent();
    }
    super.update(dt);
    if (!isTop) {
      position = Vector2(game.size.x - 16, game.size.y / 2);
    }

    if (isTop) {
      text = "Player1: ${game.topPlayerScore}";
    } else {
      text = "Player2: ${game.bottomPlayerScore}";
    }
    position.y = game.size.y / 2;
  }
}
