import 'package:flame/sprite.dart';
import 'dart:ui';
import 'package:betrayer/components/fly.dart';
import 'package:betrayer/betrayer-game.dart';

class HouseFly extends Fly {
  double get speed => game.tileSize * 5;
  HouseFly(BetrayerGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    // INITIAL FLIES
    // flyingSprite.add(Sprite('flies/028-poker-face.png'));
    // flyingSprite.add(Sprite('flies/037-angry.png'));

    // ADVANCED FLIES
    // flyingSprite.add(Sprite('flies/fly_1.png'));
    // flyingSprite.add(Sprite('flies/fly_2.png'));
    flyingSprite.add(Sprite('flies/fly_3.png'));
    flyingSprite.add(Sprite('flies/fly_4.png'));
    flyingSprite.add(Sprite('flies/fly_5.png'));
    flyingSprite.add(Sprite('flies/fly_6.png'));
    flyingSprite.add(Sprite('flies/fly_7.png'));
    flyingSprite.add(Sprite('flies/fly_8.png'));
    flyingSprite.add(Sprite('flies/fly_9.png'));
    flyingSprite.add(Sprite('flies/fly_10.png'));
    flyingSprite.add(Sprite('flies/fly_11.png'));
    // flyingSprite.add(Sprite('flies/fly_12.png'));
    // flyingSprite.add(Sprite('flies/fly_13.png'));
    // flyingSprite.add(Sprite('flies/fly_14.png'));
    // flyingSprite.add(Sprite('flies/fly_15.png'));
    // flyingSprite.add(Sprite('flies/fly_16.png'));
    // flyingSprite.add(Sprite('flies/fly_17.png'));
    // flyingSprite.add(Sprite('flies/fly_18.png'));
    // flyingSprite.add(Sprite('flies/fly_19.png'));
    // flyingSprite.add(Sprite('flies/fly_20.png'));

    deadSprite = Sprite('flies/015-dead.png');
  }
}
