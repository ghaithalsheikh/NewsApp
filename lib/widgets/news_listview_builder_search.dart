import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/view/result_search_empty.dart';
import 'package:news_app/viewmodel/viewmodel_news_search.dart';
import 'package:news_app/widgets/messages_error.dart';
import 'package:news_app/widgets/news_tile_listview_search.dart';
import 'package:news_app/widgets/shimmer_widget.dart';
import 'package:provider/provider.dart';

class NewsListViewBuilderSearch extends StatefulWidget {
  const NewsListViewBuilderSearch({
    super.key,
    required this.searchName,
  });
  final String searchName;
  @override
  State<NewsListViewBuilderSearch> createState() =>
      _NewsListViewBuilderSearchState();
}

class _NewsListViewBuilderSearchState extends State<NewsListViewBuilderSearch> {
  dynamic future;

  @override
  void initState() {
    super.initState();
    future =
        NewsSearchViewModel().fetchNewsSearch(searchName: widget.searchName);
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsSearchViewModel>(context);
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            newsViewModel.newsSearch = snapshot.data;
            return snapshot.data!.isEmpty
                ? const ResultSearchEmptyView()
                : NewsTileListViewSearch();
          } else if (snapshot.hasError) {
            const MessagesErrore().showSnackBar(context);
            return SliverToBoxAdapter(child: Container());
          } else {
            return const SliverToBoxAdapter(child: ShimmerWidget());
          }
        });
  }
}
