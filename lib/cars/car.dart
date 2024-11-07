import 'dart:async';
import 'package:flame/components.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_game.dart';

class Car extends SpriteComponent with HasGameRef<GoGreenGame> {
  late double xPosition;
  late double yPosition;
  late String carModel;
  bool shouldUpdatePosition = false;
  bool isMoving = true; 
  static const double MOVEMENT_SPEED = 100.0;
  static const double TARGET_MOVEMENT = 40.0;
  double distanceMoved = 0.0;

  Car(this.xPosition, this.carModel, this.yPosition);

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(carModel);
    size = Vector2(100, 200);
    position = Vector2(xPosition, gameHeight / 2 - yPosition);
    anchor = Anchor.topCenter;
  }

  @override
  void update(double dt) {
    if (!isMoving) return;  // Don't update if not moving
    super.update(dt);
    
    if (shouldUpdatePosition) {
      double moveAmount = MOVEMENT_SPEED * dt;
      distanceMoved += moveAmount;
      position.y -= moveAmount;

      if (distanceMoved >= TARGET_MOVEMENT) {
        position.y = position.y + (distanceMoved - TARGET_MOVEMENT);
        shouldUpdatePosition = false;
        distanceMoved = 0.0;
      }
    }
  }

  void stop() {
    isMoving = false;
    shouldUpdatePosition = false;
  }

  void triggerPositionUpdate() {
    shouldUpdatePosition = true;
    distanceMoved = 0.0;
  }
}
  

