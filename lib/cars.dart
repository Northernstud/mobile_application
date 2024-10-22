import 'dart:async';

import 'package:flame/components.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_game.dart';

class Car extends SpriteComponent with HasGameRef<GoGreenGame> {
  late double xPoition;
  late String car_model;

  Car(this.xPoition, this.car_model);

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(car_model);
    size = Vector2(100, 200);
    position = Vector2(xPoition, gameHeight / 2 - 700);
    anchor = Anchor.topCenter;
  }

  @override
  void update(double dt) {
    super.update(dt);

    //speed
    double newY = position.y - (dt * 0);

    if (newY < -(gameRef.size.y / 2)) {
      newY = -gameRef.size.y / 2;
    }

    position.y = newY;
  }
}
