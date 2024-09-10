import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    brightness: Brightness.light, // Explicitly set brightness for light theme
    appBarTheme: appBarThemeLight(),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Muli',
    brightness: Brightness.dark, // Explicitly set brightness for dark theme
    appBarTheme: appBarThemeDark(),
  );
}

AppBarTheme appBarThemeLight() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}

AppBarTheme appBarThemeDark() {
  return const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
  );
}
