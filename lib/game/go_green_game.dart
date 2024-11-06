import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_world.dart';

class GoGreenGame extends FlameGame {
  final aswers = 2;
  late final GoGreenWorld gameWorld;

  GoGreenGame()
      : super(
            camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight,
        )) {
    gameWorld = GoGreenWorld();
    world = gameWorld;
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    debugMode = true;
  }

  @override
  Color backgroundColor() => Colors.white;
}
