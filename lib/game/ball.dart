import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame_pong/enums/difficulty.dart';
import 'package:flame_pong/game/pong_game.dart';
import 'package:flutter/material.dart';

class Ball extends PositionComponent with HasGameReference<PongGame> {
  late final Vector2 velocity;
  final Paint _paint = Paint()..color = Colors.white;

  Ball()
      : super(
          size: Vector2(16, 16),
          anchor: Anchor.center,
        );

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
    super.render(canvas);
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    switch (game.difficulty) {
      case GameDifficulty.medium:
        velocity = Vector2(48, 24);
        break;
      case GameDifficulty.hard:
        velocity = Vector2(64, 36);
        break;
      case GameDifficulty.unbeatable:
        velocity = Vector2(96, 48);
        break;
    }
  }

  @override
  void update(double dt) {
    if (position.x < 0 || position.x > game.size.x) {
      velocity.x = -velocity.x;
    }
    if (position.y < 0 || position.y > game.size.y) {
      velocity.y = -velocity.y;
    }
    position.add(velocity * 6 * dt);
    super.update(dt);
  }
}
