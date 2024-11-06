import 'dart:async';
import 'package:flame/components.dart';
import 'package:mobile_application/cars/ai_car.dart';
import 'package:mobile_application/cars/car.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/game/go_green_world.dart';

class Finish extends SpriteComponent with HasGameRef<GoGreenGame> {
  Car? playerCar;
  AiCar? aiCar;
  GoGreenWorld? world;
  bool shouldMove = false;
  bool gameEnded = false;
  double targetY = -380;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("finish.png");
    position = Vector2(0, -(gameRef.size.y / 2) - size.y / 2 - 20);
    anchor = Anchor.center;
    size = Vector2(440, 200);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!gameEnded &&
        (playerCar!.position.y <= -380 || aiCar!.position.y <= -380)) {
      shouldMove = true;
      gameEnded = true;
    }

    if (shouldMove) {
      double speed = 720;

      if (position.y < targetY) {
        position.y += dt * speed;

        if (position.y >= targetY) {
          position.y = targetY;
          shouldMove = false;
        }

        if (position.y == targetY) {
          world?.pauseGame();
        }
      }
    }
  }
}
