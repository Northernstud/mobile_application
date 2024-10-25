import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';

class Question extends PositionComponent {
  final List<int> numbers; // Text for the question

  Question({required this.numbers}) {
    size = Vector2(gameWidth * 3 / 4, 400);
    position = Vector2(0, - gameHeight / 2 + 300);
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
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

    // Prepare the text painter
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${numbers[0]} + ${numbers[1]} = ?',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 60,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    // Center the text inside the rounded rectangle
    textPainter.paint(canvas, Offset(
      (size.x - textPainter.width) / 2,
      (size.y - textPainter.height) / 2,
    ));
  }
}
