import 'package:flutter/material.dart';

class DarkModeModel extends ChangeNotifier {
  bool _isDarkMode = false;

   get isDark => _isDarkMode;

  toggle(){
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
