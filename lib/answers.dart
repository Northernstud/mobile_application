import 'package:flame/events.dart';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';

class Answers extends PositionComponent with TapCallbacks {
  Answers() {
    size = Vector2(450, 150);
    position = Vector2(- gameWidth / 4, gameHeight / 2 - 400);
    anchor = Anchor.center; // Anchor the rectangle to its center
  }
  

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw the rounded rectangle
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, width, height),
        const Radius.circular(20),
      ),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }
}
