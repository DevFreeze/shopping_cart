import 'package:flutter/material.dart';

ThemeData get themeData {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
  );
}
