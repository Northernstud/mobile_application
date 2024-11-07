import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';

class Background extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    parallax = await Parallax.load(
      [ParallaxImageData('background-2.png')],
      baseVelocity: Vector2(0, -800),
      velocityMultiplierDelta: Vector2(1.0, 1.0),
      repeat: ImageRepeat.repeatY,
    );

    size = Vector2(game.size.x, game.size.y);
    position = Vector2(-gameWidth / 2, -gameHeight / 2);
    anchor = Anchor.topLeft;
  }

  void stopBackground() {
    parallax?.baseVelocity = Vector2.zero();
  }
  
}
