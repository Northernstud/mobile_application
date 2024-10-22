import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';

class Road extends ParallaxComponent {

  
  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Load the road image as a parallax with infinite scrolling
    parallax = await Parallax.load(
      [ParallaxImageData('road.png')],
      baseVelocity: Vector2(0, -800), // Vertical scrolling (moving downward)
      velocityMultiplierDelta: Vector2(1.0, 1.0),
      repeat: ImageRepeat
          .repeatY, // This makes the parallax repeat infinitely in the Y direction
    );

    // Set the position of the parallax component to start at the top-left
    position = Vector2(-220, -gameHeight/2);
    anchor = Anchor.topLeft;
  }
}
