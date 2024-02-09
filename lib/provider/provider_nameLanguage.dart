import 'package:flutter/material.dart';

class ProviderNameLanguage extends ChangeNotifier {
  String _nameLanguage = 'us';
  String get nameLanguage => _nameLanguage;

  void setNameLanguage(String newName) {
    _nameLanguage = newName;
    notifyListeners();
  }
}
