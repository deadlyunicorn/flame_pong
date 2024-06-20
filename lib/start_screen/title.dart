import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          "PONG!",
          style: TextStyle(fontSize: 96),
        ),
        Text(
          "Made by deadlyunicorn.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
