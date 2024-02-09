import 'package:flutter/material.dart';

class ProviderTheme extends ChangeNotifier {
  ThemeData dark = ThemeData(brightness: Brightness.dark);
  ThemeData light = ThemeData(brightness: Brightness.light);
  bool toggle = false;

  void toggleTheme(bool newValue) {
    toggle = newValue;

    notifyListeners();
  }
}
