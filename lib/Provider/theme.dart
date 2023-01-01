import 'package:flutter/material.dart';

class TemporaryData extends ChangeNotifier {
  // Theme Changer
  bool _theme = true;
  bool get theme => _theme;

  void changeTheme() {
    _theme = !_theme;
    notifyListeners();
  }

  // Tab

  int _index = 0;
  int get index => _index;

  void rant() {
    _index = 0;
    notifyListeners();
  }

  void following() {
    _index = 1;
    notifyListeners();
  }

  void followers() {
    _index = 2;
    notifyListeners();
  }
}
