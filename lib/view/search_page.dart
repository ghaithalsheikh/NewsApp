import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/widgets/news_listview_builder_search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.searchName});
  final String searchName;
  @override
  Widget build(BuildContext context) {
    // final prvoiderSearch = Provider.of<ProviderSearchName>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              tr(
                'Results about',
              ),
              style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(5),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  searchName,
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                ),
              ),
            ),
          ],
        ),
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
            NewsListViewBuilderSearch(searchName: searchName)
          ],
        ),
      ),
    );
  }
}
