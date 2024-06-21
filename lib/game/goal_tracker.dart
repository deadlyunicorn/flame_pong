import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_pong/game/pong_game.dart';
import 'package:flutter/material.dart';

class GoalTracker extends PositionComponent with HasGameReference<PongGame> {
  final Paint _paint = Paint()..color = Colors.green.withOpacity(0.1);
  final bool isBottom;
  GoalTracker({
    required this.isBottom,
  }) : super();

  GoalTracker.top()
      : isBottom = false,
        super(position: Vector2(0, 0));

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    size = Vector2(game.size.x, 32);
    if (isBottom) {
      position = Vector2(0, game.size.y - 32);
    }

    add(
      RectangleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isBottom) {
      position = Vector2(0, game.size.y - 32);
    }
    if (game.isPlaying == false) {
      removeFromParent();
    } else {
      size = Vector2(game.size.x, 32);
    }
  }
}
