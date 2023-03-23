import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedTab = 0;

  PageController controller = PageController();

  int get selectedTab {
    return _selectedTab;
  }

  set selectedTab(int valor) {
    _selectedTab = valor;

    controller.animateToPage(_selectedTab,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    notifyListeners();
  }
}
