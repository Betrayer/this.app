import 'dart:ui';
import 'package:betrayer/betrayer-game.dart';
import 'package:flame/sprite.dart';
import 'package:betrayer/view.dart';
import 'package:betrayer/components/callout.dart';

class Fly {
  final BetrayerGame game;
  Rect flyRect;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  Offset targetLocation;
  Callout callout;

  Fly(this.game) {
    setTargetLocation();
    callout = Callout(this);
  }

  double get speed => game.tileSize * 3;

  void setTargetLocation() {
    double x = game.rnd.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    // I MESSED UP HERE, BUT CODE ISN'T DEAD
    // if (isDead) {
    //   deadSprite.renderRect(c, flyRect.inflate(2));
    // } else {
    //   flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    // }
    // if (game.activeView == View.playing) {
    //   callout.render(c);
    // }

    // RESIZING
    // c.drawRect(
    // flyRect.inflate(flyRect.width / 2), Paint()..color = Color(0x77ffffff));

    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(flyRect.width / 2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()]
          .renderRect(c, flyRect.inflate(flyRect.width / 2));
      if (game.activeView == View.playing) {
        callout.render(c);
      }
    }

    // c.drawRect(flyRect, Paint()..color = Color(0x88000000));
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * t;
      callout.update(t);
      // if (flyingSpriteIndex >= 2) { // LEADS TO OVERLAP, NYEEEH
      while (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }

      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  void onTapDown() {
    if (!isDead) {
      isDead = true;

      if (game.activeView == View.playing) {
        game.score += 1;
      }
      if (game.score > (game.storage.getInt('highscore') ?? 0)) {
        game.storage.setInt('highscore', game.score);
        game.highscoreDisplay.updateHighscore();
      }
    }
    // isDead = true;
    // // game.spawnFly();
  }
}
