import 'package:flame/sprite.dart';
import 'dart:ui';
import 'package:betrayer/components/fly.dart';
import 'package:betrayer/betrayer-game.dart';

class AngryFly extends Fly {
  double get speed => game.tileSize * 7;
  AngryFly(BetrayerGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/050-angry.png'));
    flyingSprite.add(Sprite('flies/037-angry.png'));
    deadSprite = Sprite('flies/015-dead.png');
  }
}
