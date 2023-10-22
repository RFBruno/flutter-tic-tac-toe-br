import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/my_flutter_app_icons.dart';

class TurnWidget extends StatelessWidget {
  final bool turn;
  const TurnWidget({
    Key? key,
    required this.turn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: turn ? Colors.blue.shade200 : Colors.red.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Turn: ",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Icon(
              turn ? MyFlutterApp.circle_empty : MyFlutterApp.cancel,
              color: Colors.black,
              size: 26,
            ),
          ],
        ),
      ),
    ));
  }
}
