import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:betrayer/betrayer-game.dart';

class MusicButton {
  final BetrayerGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  MusicButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.tileSize * .25,
      game.tileSize,
      game.tileSize,
    );
    enabledSprite = Sprite('menu/music.png');
    disabledSprite = Sprite('menu/music_off.png');
  }

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, rect);
    } else {
      disabledSprite.renderRect(c, rect);
    }
  }

  void onTapDown() {
    if (isEnabled) {
      isEnabled = false;
      game.homeBGM.setVolume(0);
      game.backgroundBGM.setVolume(0);
    } else {
      isEnabled = true;
      game.homeBGM.setVolume(.25);
      game.backgroundBGM.setVolume(.25);
    }
  }
}
