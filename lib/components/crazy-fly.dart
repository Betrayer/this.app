import 'package:flame/sprite.dart';
import 'dart:ui';
import 'package:betrayer/components/fly.dart';
import 'package:betrayer/betrayer-game.dart';

class CrazyFly extends Fly {
  double get speed => game.tileSize * 10;
  CrazyFly(BetrayerGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.1, game.tileSize * 1.1);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/016-angry.png'));
    flyingSprite.add(Sprite('flies/046-crazy.png'));
    // flyingSprite.add(Sprite('flies/zombie_1.png'));
    // flyingSprite.add(Sprite('flies/zombie_2.png'));
    // flyingSprite.add(Sprite('flies/zombie_3.png'));
    deadSprite = Sprite('flies/015-dead.png');
  }
}
