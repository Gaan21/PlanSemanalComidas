import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  int _navDrawerIndex = 0;
  int get navDrawerIndex => _navDrawerIndex;
  set navDrawerIndex(int value) {
    _navDrawerIndex = value;
    notifyListeners();
  }
}
