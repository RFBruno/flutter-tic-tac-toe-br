import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/constants.dart';
import 'package:tic_toc_toe_br/app/page/home/home_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final _myRoutes = {
    HOME_PAGE_ROUTE_NAME: (_) => const HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Milku",
        brightness: Brightness.dark,
        useMaterial3: true,
      ).copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.purple.shade300,
          ),
        ),
      ),
      initialRoute: HOME_PAGE_ROUTE_NAME,
      routes: _myRoutes,
    );
  }
}
