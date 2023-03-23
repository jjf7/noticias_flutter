import 'package:flutter/material.dart';
import 'package:noticias/providers/navigation_provider.dart';
import 'package:noticias/screens/screens.dart';
import 'package:noticias/theme/theme.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text('Noticias by JFdeSousa')),
        body: _PageViewTab(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      selectedItemColor: theme.primaryColor,
      currentIndex: navigationProvider.selectedTab,
      onTap: (int valor) {
        navigationProvider.selectedTab = valor;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_alt_1_outlined),
          label: "Para vos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wrap_text_outlined),
          label: "Encabezados",
        ),
      ],
    );
  }
}

class _PageViewTab extends StatelessWidget {
  const _PageViewTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: navigationProvider.controller,
      children: const [
        Tab1Screen(),
        Tab2Screen(),
      ],
    );
  }
}
