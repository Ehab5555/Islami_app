import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String language = "en";
  bool get isArabic => language.toLowerCase() == "ar";
  bool get isDark => themeMode == ThemeMode.dark;
  SharedPreferences? pref;
  String get backgroundImagePath =>
      'assets/images/${isDark ? 'dark_bg' : 'default_bg'}.png';
  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    setThemeMode();
    notifyListeners();
  }

  void changeLanguage(String lang) {
    language = lang;
    setLang();
    notifyListeners();
  }

  Future<void> setThemeMode() async {
    pref = await SharedPreferences.getInstance();
    await pref!.setBool('darkMode', isDark);
  }

  Future<void> getThemeMode() async {
    pref = await SharedPreferences.getInstance();
    bool? mode = pref!.getBool('darkMode');

    if (mode != null) {
      mode ? themeMode = ThemeMode.dark : themeMode = ThemeMode.light;
      notifyListeners();
    }
  }

  Future<void> setLang() async {
    pref = await SharedPreferences.getInstance();
    await pref!.setBool('ar', isArabic);
  }

  Future<void> getLang() async {
    pref = await SharedPreferences.getInstance();
    bool? arabic = pref!.getBool('ar');
    if (arabic != null) {
      arabic ? language = "ar" : language = "en";
      notifyListeners();
    }
  }
}
