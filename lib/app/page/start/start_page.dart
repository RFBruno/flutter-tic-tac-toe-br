import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/constants.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, HOME_PAGE_ROUTE_NAME);
          },
          child: const Text("Iniciar"),
        ),
      ),
    );
  }
}
