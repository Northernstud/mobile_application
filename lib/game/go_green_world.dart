import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:mobile_application/cars/ai_car.dart';
import 'package:mobile_application/background_elements/background.dart';
import 'package:mobile_application/background_elements/finish.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/cars/car.dart';
import 'package:mobile_application/ui/progress_bar.dart';
import 'package:mobile_application/ui/questions.dart';
import 'package:mobile_application/background_elements/road.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  final Random _random = Random();
  final List<int> numbers;
//[Random().nextInt(10), Random().nextInt(10)]

  Car? playerCar;
  AiCar? aiCar;
  Finish? finish;
  Background? background;
  Road? road;
  late ProgressBar progressBar;

  bool correctness = false;
  bool newQuestion = false;
  bool isPaused = false;

  GoGreenWorld(this.numbers);

  List<int> generateUniqueAnswers(
      int correctAnswer, int numAnswers, int min, int max) {
    final Set<int> answers = {correctAnswer};

    while (answers.length < numAnswers) {
      final int randomNum = min + _random.nextInt(max - min);
      answers.add(randomNum);
    }

    return answers.toList();
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _initializeCars();
    _generateAndShuffleAnswers();
    _initializeBackgroundElements();

    final Sprite playerIcon = await Sprite.load('player_car_progress_bar.png');
    final Sprite aiIcon = await Sprite.load('ai_car_progress_bar.png');
    final Sprite finishIcon = await Sprite.load('racing-flag.png');

    // Initialize the progress bar after sprites are loaded
    progressBar = ProgressBar(
      barHeight: 60,
      playerProgress: 0.0,
      aiProgress: 0.0,
      playerIcon: playerIcon,
      aiIcon: aiIcon,
      finishIcon: finishIcon,
    );

    add(background!);
    add(road!);
    add(finish!);
    if (playerCar != null) add(playerCar!);
    if (aiCar != null) add(aiCar!);
    add(Question(numbers: numbers));
    add(progressBar);
  }

  void _initializeCars() {
    playerCar = Car(115, "player_car.png", 700);
    aiCar = AiCar(-120, "ai_car.png", 700);
  }

  void _generateAndShuffleAnswers() {
    final int correctAnswer = numbers[0] + numbers[1];
    final List<int> allAnswers = generateUniqueAnswers(correctAnswer, 4, 0, 20);
    allAnswers.shuffle(_random);
  }

  void _initializeBackgroundElements() {
    finish = Finish()
      ..playerCar = playerCar
      ..aiCar = aiCar;

    background = Background();
    road = Road();
  }

  void setAnswerCorrect(bool isCorrect) {
    print('setAnswerCorrect called with: $isCorrect');
    if (isCorrect) {
      print('Triggering car position update');
      playerCar?.triggerPositionUpdate();
    }
  }

  void setNewQuestion(bool isCorrect) {
    if (isCorrect) {
      newQuestion = true;
      _updateNumbersForNewQuestion();
    }
  }

  void _updateNumbersForNewQuestion() {
    numbers[0] = _random.nextInt(10);
    numbers[1] = _random.nextInt(10);
  }

  void stopAllMovement() {
    if (isPaused) return;

    isPaused = true;
    background?.stopBackground();
    road?.stopRoad();

    print("Game has ended, all movement stopped.");
  }

  @override
  void update(double dt) {
    progressBar.playerProgress = playerCar!.calculateRoadPercentage();
    progressBar.aiProgress = aiCar!.calculateRoadPercentage();

    if (isPaused) return;
    super.update(dt);

    if (newQuestion) {
      print("New Question just set");
      newQuestion = false;
    }
  }
}
