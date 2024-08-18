import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/tabs/quran/quran_sura.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        QuranSura.routeName: (_) => QuranSura(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      themeMode: ThemeMode.system,
    );
  }
}
