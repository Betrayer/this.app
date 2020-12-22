import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'components/fly.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'components/backyard.dart';
import 'components/house-fly.dart';
import 'components/angry-fly.dart';
import 'components/crazy-fly.dart';
import 'view.dart';
import 'package:betrayer/views/home-view.dart';
import 'package:betrayer/components/start-button.dart';
import 'package:betrayer/views/lost-view.dart';
import 'package:betrayer/controllers/spawner.dart';

class BetrayerGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  Backyard background;
  View activeView = View.home;
  HomeView homeView;
  StartButton startButton;
  LostView lostView;
  FlySpawner spawner;

  BetrayerGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    rnd = Random();

    background = Backyard(this);
    homeView = HomeView(this);
    startButton = StartButton(this);
    lostView = LostView(this);
    spawner = FlySpawner(this);
    // spawnFly();
  }

  void spawnFly() {
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
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
    if (activeView == View.lost) lostView.render(canvas);
  }

  void update(double t) {
    spawner.update(t);
    flies.forEach((Fly fly) => fly.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    if (!isHandled) {
      bool didHitAFly = false;
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitAFly = true;
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        activeView = View.lost;
      }
    }

    // flies.forEach((Fly fly) {
    //   if (fly.flyRect.contains(d.globalPosition)) {
    //     fly.onTapDown();
    //     // print('hit');
    //   } else {
    //     // print('miss');
    //   }
    // });
  }
}
