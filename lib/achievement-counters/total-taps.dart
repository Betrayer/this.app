// import 'package:betrayer/betrayer-game.dart';
// import 'package:betrayer/view.dart';

// class TotalTaps {
//   final BetrayerGame game;

//   TotalTaps(this.game) {
//     updateTotalTaps();
//   }

//   void updateTotalTaps() {
//     int totalTaps = game.storage.getInt('totalTaps') ?? 0;
//       if (game.activeView == View.playing) {
//         game.score += 1;
//       }
//       if (game.score > (game.storage.getInt('totalTaps') ?? 0)) {
//         game.storage.setInt('totalTaps', game.totalTaps);
//         game.updateTotalTaps.updateTotalTaps();
//       }

//     print(totalTaps);
//   }
// }

import 'package:betrayer/betrayer-game.dart';
import 'package:flutter/material.dart';

class TotalTaps {
  final BetrayerGame game;

final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));


  TotalTaps(this.game) {
    threeTaps();
  }

  void threeTaps() {
    print("sup"); // DILIT DIS
  }
}
