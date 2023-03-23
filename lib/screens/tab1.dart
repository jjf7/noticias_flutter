import 'package:flutter/material.dart';
import 'package:noticias/widgets/news.dart';
import 'package:provider/provider.dart';

import 'package:noticias/services/news_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsService = Provider.of<NewsService>(context);

    final news = newsService.headlines;

    return Scaffold(
      body: News(news),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
