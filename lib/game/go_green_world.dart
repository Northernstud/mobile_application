import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:mobile_application/cars/ai_car.dart';
import 'package:mobile_application/background_elements/background.dart';
import 'package:mobile_application/background_elements/finish.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/cars/car.dart';
import 'package:mobile_application/ui/questions.dart';
import 'package:mobile_application/background_elements/road.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  final Random _random = Random();
  List<int> numbers = [4, 7];
  Car? playerCar;
  AiCar? aiCar;
  Finish? finish;
  Background? background;
  Road? road;
  bool correctness = false;
  bool newQuestion = false;
  bool isPaused = false;

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
  Future<void> onLoad() async {
    super.onLoad();

    // Initialize playerCar and aiCar
    playerCar = Car(115, "player_car-removebg-preview.png", 700);
    aiCar = AiCar(-120, "ai_car-removebg-preview.png", 700);

    // Generate answers
    int correctAnswer = numbers[0] + numbers[1];
    List<int> allAnswers = generateUniqueAnswers(correctAnswer, 4, 0, 20);
    allAnswers.shuffle(_random);

    // Initialize the finish object
    finish = Finish()
      ..playerCar = playerCar
      ..aiCar = aiCar;

    background = Background();
    road = Road();

    add(background!);
    add(road!);
    add(finish as Component);
    if (playerCar != null) add(playerCar!);
    if (aiCar != null) add(aiCar!);
    add(Question(numbers: numbers));
  }

  void setAnswerCorrect(bool isCorrect) {
    print('setAnswerCorrect called with: $isCorrect');
    if (isCorrect && playerCar != null) {
      print('Triggering car position update');
      playerCar!.triggerPositionUpdate();
    }
  }

  void setNewQuestion(bool isCorrect) {
    if (isCorrect) {
      newQuestion = isCorrect;
      // Update numbers for new question
      numbers[0] = _random.nextInt(10);
      numbers[1] = _random.nextInt(10);
    }
  }

  void stopAllMovement() {
    if (isPaused) return;  // Prevent multiple calls
    
    isPaused = true;
    playerCar?.stop();
    aiCar?.stop();
    background?.stopBackground();
    road?.stopRoad();


    
    print("Game has ended, all movement stopped.");
  }

  @override
  void update(double dt) {
    if (isPaused) return;
    super.update(dt);
    
    if (newQuestion) {
      print("New Question just set");
      newQuestion = false;
    }
  }
}
