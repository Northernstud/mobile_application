import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/game/go_green_world.dart';

class ButtonScreen extends StatefulWidget {
  ButtonScreen({super.key, required this.game, required this.world});

  final GoGreenGame game;
  final GoGreenWorld world;

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  final Random _random = Random();
  late List<int> answerList;
  late int correctAnswer;
  late List<Color> buttonColors;
  bool buttonsEnabled = true; // Flag to disable buttons

  @override
  void initState() {
    super.initState();
    _generateAnswers();
  }

  void _generateAnswers() {
    // Fetch the latest numbers from GoGreenWorld
    correctAnswer = widget.world.numbers.reduce((a, b) => a + b);

    // Create a set to store unique answers
    Set<int> answers = {correctAnswer};
    while (answers.length < 4) {
      int randomAnswer = _random.nextInt(21);
      if (randomAnswer != correctAnswer) {
        answers.add(randomAnswer);
      }
    }

    // Convert set to list and shuffle
    answerList = answers.toList();
    answerList.shuffle(_random);

    // Initialize button colors
    buttonColors = List<Color>.filled(4, Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 450;
    double buttonHeight = 150;

    List<Offset> positions = [
      const Offset(40, 1500),
      const Offset(590, 1500),
      const Offset(40, 1700),
      const Offset(590, 1700),
    ];

    return Stack(
      children: List.generate(answerList.length, (index) {
        return Positioned(
          left: positions[index].dx,
          top: positions[index].dy,
          child: GestureDetector(
            onTap: buttonsEnabled ? () => _handleTap(index) : null,
            child: Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: buttonColors[index],
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                answerList[index].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _handleTap(int index) {
    bool isCorrect = answerList[index] == correctAnswer;
    setState(() {
      buttonColors[index] = isCorrect ? Colors.green : Colors.red;
      buttonsEnabled = !isCorrect; // Disable buttons if correct
    });

    if (isCorrect) {
      widget.world.setAnswerCorrect(true); // Ensure this triggers the update

      // Highlight the correct answer for 1 second
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          widget.world.setNewQuestion(true);
          _generateAnswers(); // Update answers for new question
          buttonsEnabled = true; // Re-enable buttons
        });
      });
    }
  }
}
