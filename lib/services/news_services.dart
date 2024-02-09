import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/Hive/constant.dart';
import 'package:news_app/models/articles_model.dart';

class NewsServices {
  final dio = Dio();
  final Box<ArticleModel> newsBox;
  NewsServices() : newsBox = Hive.box<ArticleModel>(HiveBoxes.newsBox);
  Future<List<ArticleModel>> getNewsTopHeadLines(
      {required String category, String search = '', String lang = ''}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=$lang&category=$category&q=$search&apiKey=becf8763621b4ef59f45e42787ee507d');

    Map<String, dynamic> jsonData = response.data;

    // Here we recive the data to display
    List<dynamic> articlesM = jsonData['articles'];
    List<ArticleModel> articlesList = [];
    for (var article in articlesM) {
      ArticleModel articleModel = ArticleModel.fromJson(article);
      articlesList.add(articleModel);
    }

    // Here we test the response when it have data we empty the box in hive
    // ignore: unnecessary_null_comparison
    if (response != null) {
      await newsBox.clear();
      // Here we stored the data in Hive to display lately
      final List<dynamic> articles = (jsonData['articles'])
          .map((json) => ArticleModel.fromJson(json))
          .toList();

      for (final article in articles) {
        await newsBox.add(article);
      }
    }

    return articlesList;
  }
}
