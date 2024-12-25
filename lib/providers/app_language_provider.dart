import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = "en";

  void changeLanguage(String newLang) {
    if (newLang == appLanguage) {
      return;
    }
    appLanguage = newLang;
    notifyListeners();
  }

  void saveDataLang(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    // saveDataToMap();
  }

  Future<void> getDataLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String language = prefs.getString('language') ?? "en";
    appLanguage = language;
    notifyListeners();
  }
}
