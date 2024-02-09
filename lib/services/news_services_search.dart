import 'package:dio/dio.dart';
import 'package:news_app/models/articles_model.dart';

class NewsServicesSearch {
  final dio = Dio();

  Future<List<ArticleModel>> getNewsTopEverythingSearch(
      {required String search}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$search&apiKey=becf8763621b4ef59f45e42787ee507d');

    Map<String, dynamic> jsonData = response.data;

    // Here we recive the data to display
    List<dynamic> articlesM = jsonData['articles'];
    List<ArticleModel> articlesList = [];
    for (var article in articlesM) {
      ArticleModel articleModel = ArticleModel.fromJson(article);
      articlesList.add(articleModel);
    }

    return articlesList;
  }
}
