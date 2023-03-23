import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noticias/services/news_service.dart';

import '../services/news_service.dart';
import '../theme/theme.dart';
import '../widgets/news.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsService>(context).categorias;
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              width: double.infinity,
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorias.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        final newsService =
                            Provider.of<NewsService>(context, listen: false);

                        newsService.selectedCategorie = categorias[index].name;
                      },
                      child: SizedBox(
                        width: 130,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  color: categorias[index].name ==
                                          newsService.selectedCategorie
                                      ? (theme.primaryColor)
                                      : (Colors.black54),
                                  categorias[index].icon,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${categorias[index].name[0].toUpperCase()}${categorias[index].name.substring(1)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                            ]),
                      ),
                    );
                  }),
            ),
            Expanded(child: News(newsService.getArticlesByCategorySelected)),
          ],
        ),
      ),
    );
  }
}
