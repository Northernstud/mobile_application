
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/game/go_green_world.dart';

class GoGreenGame extends FlameGame {
  final aswers = 2;

  GoGreenGame()
      : super(
            world: GoGreenWorld(),
            
            );
  @override
  Color backgroundColor() {
    return Color.fromARGB(255, 106, 217, 96);
  }
}
