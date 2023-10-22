import 'package:flutter/material.dart';

const START_PAGE_ROUTE_NAME = "/";
const HOME_PAGE_ROUTE_NAME = "/play";

TextStyle customText({
  double fontSize = 16.0,
  required Color color,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
