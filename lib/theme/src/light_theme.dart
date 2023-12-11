import 'package:flutter/material.dart';

import 'color.dart';
import 'text.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(
    seedColor: bermuda,
    brightness: Brightness.light,
  ),
  textTheme: textTheme,
);
