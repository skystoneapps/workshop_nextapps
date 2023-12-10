import 'package:flutter/material.dart';

import 'color.dart';
import 'text.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: bermuda,
    brightness: Brightness.dark,
  ),
  textTheme: textTheme,
);
