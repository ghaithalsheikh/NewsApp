class ArticleModel {
  final String? image;
  final String? title;
  final String? description;
  final String urlImage;
  final DateTime publishedAt;

  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.publishedAt,
  });
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
        publishedAt: DateTime.parse(json['publishedAt']),
        image: json['urlToImage'],
        title: json['title'],
        description: json['description'],
        urlImage: json['url']);
  }
}
