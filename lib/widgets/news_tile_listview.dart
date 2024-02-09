import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/viewmodel/viewmodel_news.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class NewsTileListView extends StatelessWidget {
  const NewsTileListView({super.key, this.articles});

  final List<ArticleModel>? articles;

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return NewsTile(
          articleModel: newsViewModel.news![index],
        );
      }, childCount: newsViewModel.news!.length),
    );
  }
}
