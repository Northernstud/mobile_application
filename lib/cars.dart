import 'dart:async';
import 'package:flame/components.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_game.dart';

class Car extends SpriteComponent with HasGameRef<GoGreenGame> {
  late double xPosition;
  late double yPosition;
  late String carModel;

  Car(this.xPosition, this.carModel, this.yPosition);

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(carModel);
    size = Vector2(100, 200);
    position = Vector2(xPosition, gameHeight / 2 - yPosition);
    anchor = Anchor.topCenter;
  }

  void moveVertically(double offset) {
  position.y += offset;
  print('Car moved to new Y position: ${position.y}');
}
}
