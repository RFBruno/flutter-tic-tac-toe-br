import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/my_flutter_app_icons.dart';

class HomeController extends ChangeNotifier {
  var scoreX = 0;
  var scoreO = 0;
  var scoreEq = 0;
  var turnOfO = true;
  var filledBoxes = 0;
  var finish = false;
  Map<String, dynamic> winner = {
    "label": "Draw",
    "icon": MyFlutterApp.eq,
  };
  List xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void tapped(int index) {
    if (turnOfO && xOrOList[index] == '') {
      xOrOList[index] = MyFlutterApp.circle_empty;
      filledBoxes += 1;
    } else if (!turnOfO && xOrOList[index] == '') {
      xOrOList[index] = MyFlutterApp.cancel;
      filledBoxes += 1;
    }

    turnOfO = !turnOfO;
    finish = checkTheWinner();
    notifyListeners();
  }

  bool checkTheWinner() {
    // check first row
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      toWinner(xOrOList[0]);
      // showAlertDialog('Winner', xOrOList[0]);
      return true;
    }

    // check second row
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      toWinner(xOrOList[3]);
      // showAlertDialog('Winner', xOrOList[3]);
      return true;
    }

    // check third row
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      toWinner(xOrOList[6]);
      // showAlertDialog('Winner', xOrOList[6]);
      return true;
    }

    // check first column
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      toWinner(xOrOList[0]);
      // showAlertDialog('Winner', xOrOList[0]);
      return true;
    }

    // check second column
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      toWinner(xOrOList[1]);
      // showAlertDialog('Winner', xOrOList[1]);
      return true;
    }

    // check third column
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      toWinner(xOrOList[2]);
      // showAlertDialog('Winner', xOrOList[2]);
      return true;
    }

    // check diagonal
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      toWinner(xOrOList[0]);
      // showAlertDialog('Winner', xOrOList[0]);
      return true;
    }

    // check diagonal
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      toWinner(xOrOList[2]);
      // showAlertDialog('Winner', xOrOList[2]);
      return true;
    }

    if (filledBoxes == 9) {
      toWinner(MyFlutterApp.eq);
      return true;
      // showAlertDialog('Draw', MyFlutterApp.eq);
    }

    return false;
  }

  toWinner(IconData iconWinner) {
    if (iconWinner == MyFlutterApp.circle_empty) {
      scoreO += 1;
    } else if (iconWinner == MyFlutterApp.cancel) {
      scoreX += 1;
    } else if (iconWinner == MyFlutterApp.eq) {
      scoreEq += 1;
      winner = {
        "label": "Draw",
        "icon": MyFlutterApp.eq,
      };
      return;
    }
    winner = {
      "label": "Winner",
      "icon": iconWinner,
    };
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      xOrOList[i] = '';
    }

    filledBoxes = 0;
    finish = false;
    notifyListeners();
  }
}
