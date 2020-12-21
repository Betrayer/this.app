import 'package:flame/sprite.dart';
import 'dart:ui';
import 'package:betrayer/components/fly.dart';
import 'package:betrayer/betrayer-game.dart';

class HouseFly extends Fly {
  double get speed => game.tileSize * 3;
  HouseFly(BetrayerGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/028-poker-face.png'));
    deadSprite = Sprite('flies/015-dead.png');
  }
}
