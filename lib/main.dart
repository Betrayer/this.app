import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:betrayer/betrayer-game.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';

void main() {
  BetrayerGame game = BetrayerGame();
  runApp(game.widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'bg/bg.jpg',
    'flies/015-dead.png',
    'flies/016-angry.png',
    'flies/016-angry.png',
    'flies/050-angry.png',
    'flies/046-crazy.png',
    'flies/028-poker-face.png',
    'menu/f.jpg',
    'menu/goal.jpg',
    'menu/handshake.png',
    'menu/henlo-human.jpg',
    'menu/imade.jpg',
    'menu/information.png',
    'menu/start.png',
    'menu/speech-bubble.png',
  ]);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
