import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:betrayer/betrayer-game.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  SharedPreferences storage = await SharedPreferences.getInstance();

  Flame.images.loadAll(<String>[
    'bg/bg.jpg',
    'flies/015-dead.png',
    'flies/016-angry.png',
    'flies/016-angry.png',
    'flies/050-angry.png',
    'flies/046-crazy.png',
    'flies/028-poker-face.png',
    'flies/fly_1.png',
    'flies/fly_2.png',
    'flies/fly_3.png',
    'flies/fly_4.png',
    'flies/fly_5.png',
    'flies/fly_6.png',
    'flies/fly_7.png',
    'flies/fly_8.png',
    'flies/fly_9.png',
    'flies/fly_10.png',
    'flies/fly_11.png',
    'flies/fly_12.png',
    'flies/fly_13.png',
    'flies/fly_14.png',
    'flies/fly_15.png',
    'flies/fly_16.png',
    'flies/fly_17.png',
    'flies/fly_18.png',
    'flies/fly_19.png',
    'flies/fly_20.png',
    'menu/f.jpg',
    'menu/goal.jpg',
    'menu/handshake.png',
    'menu/henlo-human.jpg',
    'menu/imade.jpg',
    'menu/information.png',
    'menu/start.png',
    'menu/speech-bubble.png',
  ]);

  BetrayerGame game = BetrayerGame(storage);
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
