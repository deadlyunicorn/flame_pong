import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_pong/enums/enums.dart';
import 'package:flame_pong/game/pong_game.dart';
import 'package:flutter/material.dart';

class PlayerPlatform extends PositionComponent with HasGameReference<PongGame> {
  final Paint _paint = Paint()..color = Colors.white;
  final int _posY = 64;
  final bool isBottom;

  PlayerPlatform({
    required this.isBottom,
  }) : super(size: Vector2(64, 8), anchor: Anchor.center);

  PlayerPlatform.top() : this(isBottom: false);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    if (!isBottom)
      position.y = _posY + .0;
    else {
      correctPositionY();
    }
    position.x = game.size.x / 2;
    add(
      RectangleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  @override
  void update(double dt) {
    if (game.gameStatus == GameStatus.waiting) {
      removeFromParent();
    }
    super.update(dt);

    if (isBottom) {
      correctPositionY();
    }
  }

  void correctPositionY() {
    position.y = game.size.y - _posY;
  }
}
