

import 'package:flutter/material.dart';

class Apptheme {

  static final  ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    brightness: Brightness.light
  );

  static final ThemeData Dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
    brightness: Brightness.dark
  );

}