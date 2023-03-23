import 'package:flutter/material.dart';
import 'package:noticias/theme/theme.dart';

import '../models/news_models.dart';

class News extends StatelessWidget {
  final List<Article> articles;

  const News(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return articles.isNotEmpty
        ? ListView.builder(
            itemCount: articles.length,
            itemBuilder: (_, index) {
              return _Article(articles[index], index);
            },
          )
        : Center(
            child: CircularProgressIndicator(
            backgroundColor: theme.primaryColor,
          ));
  }
}

class _Article extends StatelessWidget {
  final Article article;
  final int index;

  const _Article(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(children: [
        Row(
          children: [
            Text(
              '${index + 1}.',
              style: TextStyle(color: theme.primaryColor),
            ),
            const SizedBox(width: 10),
            Text(article.source.name),
          ],
        ),
        const SizedBox(height: 10),
        Text(article.title, style: const TextStyle(fontSize: 30)),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          child: _ImageNew(article: article),
        ),
        const SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.all(15.5),
            child: Text(
              article.description ?? '',
              style: const TextStyle(fontSize: 18),
            )),
        _ButtonsNews(),
      ]),
    );
  }
}

class _ButtonsNews extends StatelessWidget {
  const _ButtonsNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            child: Icon(Icons.star_border),
            fillColor: theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            child: Icon(Icons.more),
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageNew extends StatelessWidget {
  const _ImageNew({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return article.urlToImage == null
        ? const Image(
            image: AssetImage('assets/no-image.png'),
          )
        : FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(article.urlToImage!),
          );
  }
}
