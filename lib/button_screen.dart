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

  @override
  void initState() {
    super.initState();
    _generateAnswers();
  }

  void _generateAnswers() {
    correctAnswer = widget.world.numbers.reduce((a, b) => a + b);

    Set<int> answers = {correctAnswer};
    while (answers.length < 4) {
      int randomAnswer = _random.nextInt(21);
      if (randomAnswer != correctAnswer) {
        answers.add(randomAnswer);
      }
    }

    answerList = answers.toList();
    answerList.shuffle(_random);

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
            onTap: () {
              bool isCorrect = answerList[index] == correctAnswer;
              _handleTap(index, isCorrect);
            },
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

  void _handleTap(int index, bool isCorrect) {
  setState(() {
    buttonColors[index] = isCorrect ? Colors.green : Colors.red;

  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(isCorrect ? 'Correct!' : 'Wrong!'),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
    ),
  );
}

}
