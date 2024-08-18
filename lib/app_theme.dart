import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color black = Color(0xff242424);

  // Light Theme
  static ThemeData light = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle:
            TextStyle(color: black, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.normal, color: black),
        bodyLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.normal, color: black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        unselectedItemColor: white,
        selectedItemColor: black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: lightPrimary,
            textStyle: const TextStyle(
                fontSize: 25, color: white, fontWeight: FontWeight.normal)),
      ));

  // Dark Theme
  static ThemeData dark = ThemeData();
}
