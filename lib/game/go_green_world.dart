import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:mobile_application/ai_car.dart';
import 'package:mobile_application/background.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/cars.dart';
import 'package:mobile_application/questions.dart';
import 'package:mobile_application/road.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  final Random _random = Random();
  List<int> numbers = [4, 7];
  Car? playerCar; // Declare with late
  AiCar? aiCar;

  List<int> generateUniqueAnswers(
      int correctAnswer, int numAnswers, int min, int max) {
    Set<int> answers = {correctAnswer};

    while (answers.length < numAnswers) {
      int randomNum = min + _random.nextInt(max - min);
      answers.add(randomNum);
    }

    return answers.toList();
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    // Initialize playerCar here
    playerCar = Car(115, "player_car-removebg-preview.png", 700);
    aiCar = AiCar(-120, "ai_car-removebg-preview.png", 700);

    int correctAnswer = numbers[0] + numbers[1];
    List<int> allAnswers = generateUniqueAnswers(correctAnswer, 4, 0, 20);
    allAnswers.shuffle(_random);

    // Add components to the world
    add(Background());
    add(Road());
    add(playerCar as Component); // Ensure playerCar is added to the world
    add(aiCar as Component);
    add(Question(numbers: numbers));
  }
}
