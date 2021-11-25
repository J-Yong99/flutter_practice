// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/flame.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/game/base_game.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/gestures.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:th_project_game/components/bird.dart';

late Size size;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  size = await Flame.util.initialDimensions();

  runApp(MyGame().widget);
}

class MyGame extends BaseGame with TapDetector {
  late Bird _bird;

  MyGame() {
    _bird = Bird();

    this
      ..add(
          SpriteComponent.fromSprite(size.width, size.height, Sprite('bg.png')))
      ..add(Bird());
  }

  @override
  void onTap() {
    // TODO: implement onTap
    _bird.onTap();
    //super.onTap();
  }
}
