import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_pong/enums/enums.dart';
import 'package:flame_pong/game/goal_tracker.dart';
import 'package:flame_pong/game/pong_game.dart';
import 'package:flame_pong/game/slider.dart';
import 'package:flutter/material.dart';

class Ball extends PositionComponent
    with HasGameReference<PongGame>, CollisionCallbacks {
  late final Vector2 velocity;
  late final GameStatus _isPlaying;
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
    add(RectangleHitbox());

    _isPlaying = game.gameStatus;

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
    positionReset();
  }

  @override
  void update(double dt) {
    if (_isPlaying != game.gameStatus) {
      removeFromParent();
    }
    if (position.x < 0) {
      velocity.x = velocity.x.abs();
    } else if (position.x > game.size.x) {
      velocity.x = -velocity.x.abs();
    }

    if (position.y < 0 || position.y > game.size.y) {
      positionReset(); //? Case when a PC user resizes..
    }

    position.add(velocity * 6 * dt);
    super.update(dt);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is GoalTracker) {
      if (other.isBottom) {
        game.bottomPlayerScore++;
      } else {
        game.topPlayerScore++;
      }

      positionReset();
    } else if (other is PlayerPlatform) {
      velocity.y = -velocity.y;
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  void positionReset() {
    position = Vector2(
      (game.size.x / 2) + Random.secure().nextInt(129) - 64,
      game.size.y / 2,
    );
    velocity.y = velocity.y * pow(-1, Random.secure().nextInt(2) + 1);
  }
}
