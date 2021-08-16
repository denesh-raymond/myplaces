import 'package:flutter/material.dart';

/// Global styles used throughout the project
class Styles {
  Styles._internal();

  static final Color white = Colors.white;
  static final Color lightGrey = Colors.grey.shade200;
  static final Color darkGrey = Colors.grey.shade700;

  static final MaterialColor primarySwatch = Colors.deepOrange;

  static final TextStyle large = TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold);
  static final TextStyle medium = TextStyle(fontSize: 16.0, color: darkGrey);
}
