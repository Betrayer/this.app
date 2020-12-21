import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'components/fly.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'components/backyard.dart';
import 'components/house-fly.dart';
import 'components/angry-fly.dart';
import 'components/crazy-fly.dart';

class BetrayerGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  Backyard background;

  BetrayerGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    rnd = Random();

    background = Backyard(this);
    spawnFly();
  }

  void spawnFly() {
    // double x = rnd.nextDouble() * (screenSize.width - tileSize);
    // double y = rnd.nextDouble() * (screenSize.height - tileSize);
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    // flies.add(Fly(this, x, y));
    switch (rnd.nextInt(3)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(CrazyFly(this, x, y));
        break;
      case 2:
        flies.add(AngryFly(this, x, y));
        break;
      // case 3:
      //   flies.add(Х(this, x, y));
      //   break;
      // case 4:
      //   flies.add(Х(this, x, y));
      //   break;
    }
  }

  void render(Canvas canvas) {
    // Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    // Paint bgPaint = Paint();
    // bgPaint.color = Color(0xff576574);
    // canvas.drawRect(bgRect, bgPaint);

    background.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
