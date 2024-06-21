import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_pong/enums/enums.dart';
import 'package:flame_pong/game/ball.dart';
import 'package:flame_pong/game/goal_tracker.dart';
import 'package:flame_pong/game/score.dart';
import 'package:flame_pong/game/slider.dart';

class PongGame extends FlameGame<World>
    with
        // ignore: always_specify_types
        HasCollisionDetection,
        PanDetector {
  //TODO: Add pan detector for mobiles.

  GameDifficulty difficulty = GameDifficulty.medium;
  GameStatus gameStatus = GameStatus.waiting;
  EnemyType enemyType = EnemyType.player;

  late PlayerPlatform _topPlayer;
  late PlayerPlatform _bottomPlayer;
  int topPlayerScore = 0;
  int bottomPlayerScore = 0;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    add(Ball());
  }

  void start({
    required GameDifficulty difficulty,
  }) {
    this.difficulty = difficulty;
    gameStatus = GameStatus.playing;
    topPlayerScore = 0;
    bottomPlayerScore = 0;
    add(Ball());
    add(GoalTracker.top());
    add(GoalTracker(isBottom: true));

    _topPlayer = PlayerPlatform.top();
    _bottomPlayer = PlayerPlatform(isBottom: true);
    add(_topPlayer);
    add(_bottomPlayer);
    add(Score(isTop: true));
    add(
      Score(
        isTop: false,
      ),
    );
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);

    if (gameStatus == GameStatus.playing) {
      if (enemyType == EnemyType.ai) {
        _bottomPlayer.position.x += info.delta.global.x;
      } else {
        if (info.eventPosition.global.y > size.y / 2) {
          _bottomPlayer.position.x += info.delta.global.x;
        } else {
          _topPlayer.position.x += info.delta.global.x;
        }
      }
    }
  }
}
