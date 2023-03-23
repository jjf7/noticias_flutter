import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:noticias/screens/screens.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Noticias',
        theme: theme,
        home: const Scaffold(
          body: TabScreen(),
        ),
      ),
    );
  }
}
