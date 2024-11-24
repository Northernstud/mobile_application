import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';

class Question extends PositionComponent {
  final List<int> numbers;

  Question({required this.numbers}) {
    size = Vector2(gameWidth * 3 / 4, 200);
    position = Vector2(0, -gameHeight / 2 + 200);
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Additional loading logic can be placed here if needed in the future.
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _drawBackground(canvas);
    _drawQuestionText(canvas);
  }

  void _drawBackground(Canvas canvas) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final RRect backgroundRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, width, height),
      const Radius.circular(20),
    );

    canvas.drawRRect(backgroundRect, backgroundPaint);
  }

  void _drawQuestionText(Canvas canvas) {
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

    final Offset textOffset = Offset(
      (size.x - textPainter.width) / 2,
      (size.y - textPainter.height) / 2,
    );

    textPainter.paint(canvas, textOffset);
  }
}
