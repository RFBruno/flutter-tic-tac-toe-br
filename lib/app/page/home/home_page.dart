import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/constants.dart';
import 'package:tic_toc_toe_br/app/core/helper/my_flutter_app_icons.dart';
import 'package:tic_toc_toe_br/app/page/home/home_controller.dart';
import 'package:tic_toc_toe_br/app/page/home/widget/play_grid_widget.dart';
import 'package:tic_toc_toe_br/app/page/home/widget/scoreboard_widget.dart';
import 'package:tic_toc_toe_br/app/page/home/widget/turn_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

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
              controller.clearBoard();
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
        child: ListenableBuilder(
            listenable: controller,
            builder: (_, __) {
              if (controller.finish) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  _showAlertDialog();
                });
              }
              return Column(
                children: [
                  ScoreboardWidget(
                      scoreO: controller.scoreO,
                      scoreX: controller.scoreX,
                      scoreEq: controller.scoreEq),
                  PlayGridWidget(
                      tapped: controller.tapped, xOrOList: controller.xOrOList),
                  TurnWidget(turn: controller.turnOfO),
                ],
              );
            }),
      ),
    );
  }

  void _showAlertDialog() {
    var winner = controller.winner['icon'] as IconData;
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
                  controller.clearBoard();
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
  }
}
