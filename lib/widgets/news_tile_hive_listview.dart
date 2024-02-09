import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsTileHiveListView extends StatelessWidget {
  const NewsTileHiveListView({Key? key, required this.newsBox})
      : super(key: key);

  final Box<ArticleModel> newsBox;

  @override
  Widget build(BuildContext context) {
    final newsList = newsBox.values.toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return NewsTile(
          articleModel: newsList[index],
        );
      }, childCount: newsList.length),
    );
  }
}
