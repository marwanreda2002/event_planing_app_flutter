import 'package:flutter/cupertino.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = "en";

  void changeLanguage(String newLang) {
    if (newLang == appLanguage) {
      return;
    }
    appLanguage = newLang;
    notifyListeners();
  }
}
