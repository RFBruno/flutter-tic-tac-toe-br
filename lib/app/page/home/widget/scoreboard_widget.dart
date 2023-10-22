import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/constants.dart';
import 'package:tic_toc_toe_br/app/core/helper/my_flutter_app_icons.dart';

class ScoreboardWidget extends StatelessWidget {
  final scoreO;
  final scoreX;
  final scoreEq;

  const ScoreboardWidget({
    super.key,
    required this.scoreO,
    required this.scoreX,
    required this.scoreEq,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _player(
            context,
            MyFlutterApp.circle_empty,
            "$scoreO wins",
            Colors.blue.shade300,
          ),
          _player(
            context,
            MyFlutterApp.eq,
            "$scoreEq draw",
            Colors.blueGrey.shade300,
          ),
          _player(
            context,
            MyFlutterApp.cancel,
            "$scoreX wins",
            Colors.red.shade300,
          ),
        ],
      ),
    );
  }

  Widget _player(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 60,
            color: color,
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: customText(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
