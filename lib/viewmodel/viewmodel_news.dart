import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsViewModel extends ChangeNotifier {
  List<ArticleModel>? news;
  Future<List<ArticleModel>> fetchNews(
      {String categoryName = 'general', String? search, String? lang}) async {
    List<ArticleModel>? newsData;
    newsData = await NewsServices().getNewsTopHeadLines(
        category: categoryName, search: search!, lang: lang!);
    notifyListeners();
    return newsData;
  }
}
