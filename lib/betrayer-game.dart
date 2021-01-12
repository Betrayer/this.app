// ЛИБЫ
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:audioplayers/audioplayers.dart';
// КОМПОНЕНТЫ
import 'components/fly.dart';
import 'components/backyard.dart';
import 'components/house-fly.dart';
import 'components/angry-fly.dart';
import 'components/crazy-fly.dart';
import 'view.dart';
import 'package:betrayer/views/home-view.dart';
import 'package:betrayer/components/start-button.dart';
import 'package:betrayer/views/lost-view.dart';
import 'package:betrayer/controllers/spawner.dart';
import 'package:betrayer/components/credits-button.dart';
import 'package:betrayer/components/help-button.dart';
import 'package:betrayer/views/help-view.dart';
import 'package:betrayer/views/credits-view.dart';
import 'package:betrayer/components/score-display.dart';
import 'package:betrayer/components/highscore-display.dart';
import 'package:betrayer/components/music-button.dart';
import 'package:betrayer/components/sound-button.dart';
// DEV
import 'achievement-counters/total-taps.dart';

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
  HelpButton helpButton;
  CreditsButton creditsButton;
  HelpView helpView;
  CreditsView creditsView;
  int score;
  ScoreDisplay scoreDisplay;
  final SharedPreferences storage; // UNSURE
  HighscoreDisplay highscoreDisplay;
  AudioPlayer homeBGM; // SOUND
  AudioPlayer backgroundBGM; // SOUND
  MusicButton musicButton;
  SoundButton soundButton;
  // DEV
  TotalTaps totalTaps;
  int totalScore;

  BetrayerGame(this.storage) {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    rnd = Random();
    score = 0;
    totalScore = storage.getInt('totalScore') ?? 0;
    print(totalScore);
    // storage.setInt('totalScore', 0);
    // print(storage.getInt('totalScore'));
    // DEV
    // totalTaps = 0;

    background = Backyard(this);
    homeView = HomeView(this);
    startButton = StartButton(this);
    lostView = LostView(this);
    spawner = FlySpawner(this);
    helpButton = HelpButton(this);
    creditsButton = CreditsButton(this);
    helpView = HelpView(this);
    creditsView = CreditsView(this);
    scoreDisplay = ScoreDisplay(this);
    highscoreDisplay = HighscoreDisplay(this);
    musicButton = MusicButton(this);
    soundButton = SoundButton(this);
    // DEV
    totalTaps = TotalTaps(this);
    // spawnFly();

    homeBGM = await Flame.audio.loopLongAudio('bgm/home.mp3', volume: .25);
    homeBGM.pause();
    backgroundBGM =
        await Flame.audio.loopLongAudio('bgm/background.mp3', volume: .25);
    backgroundBGM.pause();

    playHomeBGM();
  }

  void playHomeBGM() {
    backgroundBGM.pause();
    backgroundBGM.seek(Duration.zero);
    homeBGM.resume();
  }

  void playPlayingBGM() {
    homeBGM.pause();
    homeBGM.seek(Duration.zero);
    backgroundBGM.resume();
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
    highscoreDisplay.render(canvas);
    musicButton.render(canvas);
    soundButton.render(canvas);
    if (activeView == View.playing) scoreDisplay.render(canvas);
    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      helpButton.render(canvas);
      creditsButton.render(canvas);
      startButton.render(canvas);
    }
    if (activeView == View.help) helpView.render(canvas);
    if (activeView == View.credits) creditsView.render(canvas);
    if (activeView == View.lost) lostView.render(canvas);
  }

  void update(double t) {
    spawner.update(t);
    flies.forEach((Fly fly) => fly.update(t));
    if (activeView == View.playing) scoreDisplay.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    print(totalScore);
    bool isHandled = false;

    if (totalScore == 3) {
      totalTaps.taps();
    }

    if (!isHandled) {
      if (activeView == View.help || activeView == View.credits) {
        activeView = View.home;
        isHandled = true;
      }
    }

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
          // totalTaps.updateTotalTaps(); // DEV
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        if (soundButton.isEnabled) {
          Flame.audio
              .play('sfx/ha_ha_' + (rnd.nextInt(2) + 1).toString() + '.mp3');
        }
        playHomeBGM();
        activeView = View.lost;
        // totalTaps.updateTotalTaps(); // DEV
      }
    }

    if (!isHandled && helpButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        helpButton.onTapDown();
        isHandled = true;
      }
    }

    if (!isHandled && creditsButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        creditsButton.onTapDown();
        isHandled = true;
      }
    }

    // MUSCI
    if (!isHandled && musicButton.rect.contains(d.globalPosition)) {
      musicButton.onTapDown();
      isHandled = true;
    }

    // SOUND
    if (!isHandled && soundButton.rect.contains(d.globalPosition)) {
      soundButton.onTapDown();
      isHandled = true;
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
