import 'package:flutter/material.dart';

class NavegacionBarProvider with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;
    if (_pageController.hasClients) {
      _pageController.animateToPage(valor,
          duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    }

    notifyListeners();
  }

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  int? _numNotifications;
  int? get numNotifications => _numNotifications;
  set numNotifications(int? value) {
    _numNotifications = value;
    notifyListeners();
  }
}
