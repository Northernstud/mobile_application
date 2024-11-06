import 'dart:async';
import 'package:flame/components.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_game.dart';

class AiCar extends SpriteComponent with HasGameRef<GoGreenGame> {
  late double xPosition;
  late double yPosition;
  late String carModel;
  bool isMoving = true; // Flag to control movement

  AiCar(this.xPosition, this.carModel, this.yPosition);

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(carModel);
    size = Vector2(100, 200);
    position = Vector2(xPosition, gameHeight / 2 - yPosition);
    anchor = Anchor.topCenter;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Only move if isMoving is true
    if (isMoving) {
      position.y -= 10 * dt;

      // Check if the car has reached the finish line
      if (position.y <= -420) {
        position.y = -420; // Ensure exact position
        isMoving = false;  // Stop the car from moving further
      }
    }
  }

  void stop() {
    isMoving = false;
  }
}
