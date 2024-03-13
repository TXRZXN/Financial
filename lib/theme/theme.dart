import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff121212),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Kanit',
  );
}
