import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); //380
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(const GameMath());
}
