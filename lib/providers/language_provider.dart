import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool isEn = true;

  Map<String, Object> textsAr = {
    'categoris': 'الفئات',
    'my_files': 'ملفاتي',
    'packages': 'الباقات',
    'home': 'الرئيسيه',
    'more': 'المزيد',
  };
  Map<String, Object> textsEn = {
    'categoris': 'Categoris',
    'my_files': 'My Files',
    'packages': 'Packages',
    'home': 'Home',
    'more': 'More',
  };

  changeLanguage(bool language) {
    isEn = language;
    notifyListeners();
  }

  getTexts(String text) {
    if (isEn == true) return textsEn[text];
    return textsAr[text];
  }
}
