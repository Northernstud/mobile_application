import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_world.dart';

class GoGreenGame extends FlameGame {
  GoGreenGame()
      : super(
            world: GoGreenWorld(),
            camera: CameraComponent.withFixedResolution(
              width: gameWidth,
              height: gameHeight,
            )
          );
  @override
  Color backgroundColor() {
    return Colors.green;
  }


}
