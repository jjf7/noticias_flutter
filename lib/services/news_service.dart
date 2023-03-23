// api : 3bbe5a6bba734cb99a6221fd4ef16c19

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/categories.dart';
import '../models/news_models.dart';

class NewsService extends ChangeNotifier {
  final String _baseUrl = 'newsapi.org';
  final String _token = '3bbe5a6bba734cb99a6221fd4ef16c19';
  List<Article> headlines = [];

  List<Categories> categorias = [
    Categories('business', FontAwesomeIcons.businessTime),
    Categories('entertainment', FontAwesomeIcons.tv),
    Categories('general', FontAwesomeIcons.addressCard),
    Categories('health', FontAwesomeIcons.headSideVirus),
    Categories('science', FontAwesomeIcons.vials),
    Categories('sports', FontAwesomeIcons.football),
    Categories('technology', FontAwesomeIcons.laptop),
  ];

  Map<String, List<Article>> newsByCategory = {};

  String _selectedCategorie = "business";

  String get selectedCategorie => _selectedCategorie;

  set selectedCategorie(String valor) {
    _selectedCategorie = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  get getArticlesByCategorySelected => newsByCategory[_selectedCategorie];

  NewsService() {
    this.initData();

    categorias.forEach((item) => newsByCategory[item.name] = []);

    getArticlesByCategory(this._selectedCategorie);
  }

  Future initData() async {
    try {
      final url = Uri.https(
          _baseUrl, 'v2/top-headlines', {'country': 'us', 'apiKey': _token});

      final resp = await http.get(url);

      final newsService = newsServiceFromJson(resp.body);

      headlines.addAll(newsService.articles);
      notifyListeners();
      return null;
    } catch (e) {
      print('Error = $e');
    }
  }

  Future getArticlesByCategory(String category) async {
    try {
      if (newsByCategory[category]!.isNotEmpty) {
        notifyListeners();
        return newsByCategory[category];
      }

      final url = Uri.https(_baseUrl, 'v2/top-headlines',
          {'category': category, 'country': 'us', 'apiKey': _token});

      final resp = await http.get(url);

      final newsService = newsServiceFromJson(resp.body);

      newsByCategory[category]!.addAll(newsService.articles);

      notifyListeners();
      return null;
    } catch (e) {
      print('Error = $e');
    }
  }
}
