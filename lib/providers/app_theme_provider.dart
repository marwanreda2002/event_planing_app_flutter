import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  bool isLight = true;

  void changeTheme(bool newTheme) async {
    if (isLight == newTheme) {
      return;
    }
    isLight = newTheme;
    saveDataTheme(isLight);
    notifyListeners();
  }

  void saveDataTheme(bool theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', theme);
    // saveDataToMap();
  }

  Future<void> getDataTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool language = prefs.getBool('theme') ?? true;
    isLight = language;
    notifyListeners();
  }
}
