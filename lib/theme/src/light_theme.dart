import 'package:flutter/material.dart';

import 'color.dart';
import 'text.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: bermuda,
    brightness: Brightness.light,
  ),
  textTheme: textTheme,
);
