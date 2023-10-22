import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/constants.dart';
import 'package:tic_toc_toe_br/app/core/helper/my_flutter_app_icons.dart';
import 'package:tic_toc_toe_br/app/page/home/widget/play_grid_widget.dart';
import 'package:tic_toc_toe_br/app/page/home/widget/scoreboard_widget.dart';
import 'package:tic_toc_toe_br/app/page/home/widget/turn_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _scoreX = 0;
  int _scoreO = 0;
  int _scoreEq = 0;
  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List _xOrOList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(MyFlutterApp.arrows_ccw),
            splashRadius: 25,
            onPressed: () {
              _clearBoard();
            },
          )
        ],
        title: Text(
          'Tic Tac Toe',
          style: customText(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ScoreboardWidget(
                scoreO: _scoreO, scoreX: _scoreX, scoreEq: _scoreEq),
            PlayGridWidget(tapped: _tapped, xOrOList: _xOrOList),
            TurnWidget(turn: _turnOfO),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = MyFlutterApp.circle_empty;
        _filledBoxes += 1;
      } else if (!_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = MyFlutterApp.cancel;
        _filledBoxes += 1;
      }

      _turnOfO = !_turnOfO;
      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    // check first row
    if (_xOrOList[0] == _xOrOList[1] &&
        _xOrOList[0] == _xOrOList[2] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second row
    if (_xOrOList[3] == _xOrOList[4] &&
        _xOrOList[3] == _xOrOList[5] &&
        _xOrOList[3] != '') {
      _showAlertDialog('Winner', _xOrOList[3]);
      return;
    }

    // check third row
    if (_xOrOList[6] == _xOrOList[7] &&
        _xOrOList[6] == _xOrOList[8] &&
        _xOrOList[6] != '') {
      _showAlertDialog('Winner', _xOrOList[6]);
      return;
    }

    // check first column
    if (_xOrOList[0] == _xOrOList[3] &&
        _xOrOList[0] == _xOrOList[6] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second column
    if (_xOrOList[1] == _xOrOList[4] &&
        _xOrOList[1] == _xOrOList[7] &&
        _xOrOList[1] != '') {
      _showAlertDialog('Winner', _xOrOList[1]);
      return;
    }

    // check third column
    if (_xOrOList[2] == _xOrOList[5] &&
        _xOrOList[2] == _xOrOList[8] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    // check diagonal
    if (_xOrOList[0] == _xOrOList[4] &&
        _xOrOList[0] == _xOrOList[8] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check diagonal
    if (_xOrOList[2] == _xOrOList[4] &&
        _xOrOList[2] == _xOrOList[6] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    if (_filledBoxes == 9) {
      _showAlertDialog('Draw', MyFlutterApp.eq);
    }
  }

  void _showAlertDialog(String title, IconData winner) {
    Color colorWinner = winner == MyFlutterApp.circle_empty
        ? Colors.blue.shade300
        : Colors.red.shade300;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                winner,
                size: 60,
                color: winner == MyFlutterApp.eq
                    ? Colors.blueGrey.shade300
                    : colorWinner,
              ),
              const SizedBox(height: 20),
              Text(
                winner == MyFlutterApp.eq
                    ? "The match ended in a draw"
                    : "The winner",
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 60),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(7),
                  child: Text(
                    'Restart',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (winner == MyFlutterApp.circle_empty) {
      _scoreO += 1;
    } else if (winner == MyFlutterApp.cancel) {
      _scoreX += 1;
    } else if (winner == MyFlutterApp.eq) {
      _scoreEq += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _xOrOList[i] = '';
      }
    });

    _filledBoxes = 0;
  }
}
