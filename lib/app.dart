
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/constants.dart';
import 'package:mobile_application/game/go_green_game.dart';
import 'package:mobile_application/ui/button_screen.dart';

class GameMath extends StatefulWidget {
  const GameMath({super.key});

  @override
  State<GameMath> createState() => _GameMathState();
}

class _GameMathState extends State<GameMath> {
  late final GoGreenGame game;

  @override
  void initState() {
    super.initState();
    game = GoGreenGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: FittedBox(
              child: Stack(
                children: [
                  SizedBox(
                    width: gameWidth,
                    height: gameHeight,
                    child: GameWidget(game: game)
                  ),
                  SizedBox(
                    width: gameWidth,
                    height: gameHeight,
                    child: ButtonScreen(
                      game: game,
                      world: game.gameWorld, // Pass the actual world instance
                    )
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
