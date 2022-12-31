import 'package:flutter/material.dart';

class TemporaryData extends ChangeNotifier {
  // Theme Changer
  bool _theme = true;
  bool get theme => _theme;

  void changeTheme() {
    _theme = !_theme;
    notifyListeners();
  }
}
