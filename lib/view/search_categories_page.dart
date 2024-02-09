import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/news_listview_builder.dart';

class SearchCategoriesView extends StatelessWidget {
  const SearchCategoriesView(
      {super.key,
      required this.nameCategory,
      required this.searchCAtegoryName});
  final String nameCategory;
  final String searchCAtegoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results about $searchCAtegoryName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(12.0)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: ScreenUtil().setHeight(32),
              ),
            ),
            NewsListViewBuilder(
                categoryName: nameCategory,
                searchCategoryName: searchCAtegoryName),
          ],
        ),
      ),
    );
  }
}
