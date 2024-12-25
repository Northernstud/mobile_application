import 'dart:async';
import 'package:flame/components.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_game.dart';

class AiCar extends SpriteComponent with HasGameRef<GoGreenGame> {
  final double initialXPosition;
  final double initialYPosition;
  final String carModel;
  bool isMoving = true;

  AiCar(this.initialXPosition, this.carModel, this.initialYPosition);

  @override
  FutureOr<void> onLoad() async {
    await _loadSprite();
    _initializePosition();
  }

  Future<void> _loadSprite() async {
    sprite = await Sprite.load(carModel);
    size = Vector2(100, 200);
  }

  Future<void> _initializePosition() async {
    position = Vector2(initialXPosition, gameHeight / 2 - initialYPosition);
    anchor = Anchor.topCenter;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isMoving) {
      _moveCar(dt);
      _checkFinishLine();
    }
  }

  //car speed
  void _moveCar(double dt) {
    position.y -= 11 * dt;
  }

  void _checkFinishLine() {
    if (position.y <= -420) {
      position.y = -420;
      isMoving = false;
    }
  }

  void stop() {
    isMoving = false;
  }

  double calculateRoadPercentage() {
    double startPosition = gameHeight / 2 - initialYPosition;
    const double finishPosition = -440;

    // Calculate percentage
    final percentage = (startPosition - position.y) / (startPosition - finishPosition);

    // Clamp percentage between 0 and 100
    return percentage.clamp(0.0 , 1.0);
  }
}
