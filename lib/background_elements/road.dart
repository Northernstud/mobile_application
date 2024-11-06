import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';

class Road extends ParallaxComponent {
void stopRoad() {
    parallax?.baseVelocity = Vector2.zero();
}

  @override
  Future<void> onLoad() async {
    super.onLoad();

    parallax = await Parallax.load(
      [ParallaxImageData('road_3.png')],
      baseVelocity: Vector2(0, -800),
      velocityMultiplierDelta: Vector2(1.0, 1.0),
      repeat: ImageRepeat.repeatY,
    );

    position = Vector2(-220, -gameHeight / 2);//-220
    anchor = Anchor.topLeft;
  }
}
