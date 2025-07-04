import 'package:flutter/material.dart';



final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    textTheme: TextTheme(
      displaySmall: const TextStyle(fontSize: 16),
      titleLarge: const TextStyle(color: Color(0xffffffff)),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w700, color: const Color(0xff000000)),
      labelSmall: const TextStyle(color: Color(0xff797979)),
      labelMedium: const TextStyle(),
    ));


final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(), textTheme: const TextTheme());
