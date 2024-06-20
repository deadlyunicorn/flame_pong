import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_pong/start_screen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Theme(
      data: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.blue.shade900,
          onSecondary: Colors.white,
          error: Colors.red.shade900,
          onError: Colors.white,
          surface: Colors.amber.shade900,
          onSurface: Colors.white,
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            // ignore: always_specify_types
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            // ignore: always_specify_types
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            // ignore: always_specify_types
            surfaceTintColor: WidgetStatePropertyAll(Colors.white),
            // ignore: always_specify_types
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontFamily: 'VT323',
                fontSize: 48,
              ),
            ),
          ),
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'VT323',
          fontSize: 48,
        ),
        child: SafeArea(
          child: GameWidget<PongGame>(
            game: PongGame(),
            initialActiveOverlays: <String>["startScreen"],
            // ignore: always_specify_types
            overlayBuilderMap: {
              // "test": (_, __) => Text("hello world"),
              "startScreen": (_, __) => const StartScreen(),
            },
          ),
        ),
      ),
    ),
  );
}

class PongGame extends FlameGame<World> {}
