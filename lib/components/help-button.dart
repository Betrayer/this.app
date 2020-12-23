import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:betrayer/betrayer-game.dart';
import 'package:betrayer/view.dart';

class HelpButton {
  final BetrayerGame game;
  Rect rect;
  Sprite sprite;

  HelpButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('menu/information.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.help;
  }
}
