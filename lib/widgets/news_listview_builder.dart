import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/provider/provider_nameLanguage.dart';
import 'package:news_app/viewmodel/viewmodel_news.dart';
import 'package:news_app/widgets/news_tile_hive_listview.dart';
import 'package:news_app/widgets/news_tile_listview.dart';
import 'package:news_app/widgets/shimmer_widget.dart';
import 'package:provider/provider.dart';

import '../Hive/constant.dart';

// ignore: must_be_immutable
class NewsListViewBuilder extends StatefulWidget {
  NewsListViewBuilder({
    super.key,
    required this.categoryName,
    this.searchCategoryName,
    this.future,
  });
  final String categoryName;
  final String? searchCategoryName;

  dynamic future;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  dynamic future;
  final Box<ArticleModel> box = Hive.box<ArticleModel>(HiveBoxes.newsBox);
  late String currentLanguage = 'us';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final langName = Provider.of<ProviderNameLanguage>(context).nameLanguage;

    future = NewsViewModel().fetchNews(
        categoryName: widget.categoryName,
        search: widget.searchCategoryName ?? '',
        lang: langName);
    currentLanguage = langName;
  }

  @override
  void didUpdateWidget(covariant NewsListViewBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    final langName = Provider.of<ProviderNameLanguage>(context).nameLanguage;

    if (currentLanguage != langName) {
      future = NewsViewModel().fetchNews(
          categoryName: widget.categoryName,
          search: widget.searchCategoryName ?? '',
          lang: langName);
      currentLanguage = langName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);
    return FutureBuilder<List<ArticleModel>>(
        future: widget.future ?? future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            newsViewModel.news = snapshot.data;
            return NewsTileListView();
          } else if (snapshot.hasError) {
            return NewsTileHiveListView(
              newsBox: box,
            );
          }
          return const SliverToBoxAdapter(
            child: ShimmerWidget(),
          );
        });
  }
}
