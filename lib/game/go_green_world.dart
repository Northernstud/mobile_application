import 'dart:async';

import 'package:flame/components.dart';
import 'package:mobile_application/answers.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/cars.dart';
import 'package:mobile_application/questions.dart';
import 'package:mobile_application/road.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    add(Road());
    add(Car(130, "player_car-removebg-preview.png"));
    add(Car(-135, "ai_car-removebg-preview.png"));
    add(Question(questionText: 'Govno'));
    add(Answers());
  }
}
