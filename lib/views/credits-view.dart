import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:betrayer/betrayer-game.dart';

class CreditsView {
  final BetrayerGame game;
  Rect rect;
  Sprite sprite;

  CreditsView(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * .5,
      (game.screenSize.height / 2) - (game.tileSize * 6),
      game.tileSize * 8,
      game.tileSize * 12,
    );
    sprite = Sprite('menu/henlo-human.jpg');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
