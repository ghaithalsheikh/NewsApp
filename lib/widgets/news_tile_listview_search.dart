import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/viewmodel_news_search.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class NewsTileListViewSearch extends StatelessWidget {
  const NewsTileListViewSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsSearchViewModel>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return NewsTile(
          articleModel: newsViewModel.newsSearch![index],
        );
      }, childCount: newsViewModel.newsSearch!.length),
    );
  }
}
