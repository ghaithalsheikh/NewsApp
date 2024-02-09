import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/widgets/news_listview_builder.dart';
import 'package:news_app/widgets/search_bar_categories.dart';
import '../services/news_services.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  dynamic future;

  Future<void> _refreshData() async {
    // Simulate a delay for refreshing the data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      future = NewsServices().getNewsTopHeadLines(category: widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(widget.name),
          style: TextStyle(fontSize: ScreenUtil().setSp(18)),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SearchOfBarCategories(
                  name: widget.name,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
              ),
              NewsListViewBuilder(
                categoryName: widget.name,
                future: future,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
