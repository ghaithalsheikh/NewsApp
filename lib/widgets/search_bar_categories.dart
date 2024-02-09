import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/view/search_categories_page.dart';

class SearchOfBarCategories extends StatefulWidget {
  const SearchOfBarCategories({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<SearchOfBarCategories> createState() => _SearchOfBarCategoriesState();
}

class _SearchOfBarCategoriesState extends State<SearchOfBarCategories> {
  final TextEditingController _searchController = TextEditingController();
  bool isTextFieldActive = false;
  ui.TextDirection? _currentTextDirection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(2),
          vertical: ScreenUtil().setHeight(5)),
      child: SizedBox(
        height: ScreenUtil().setHeight(40),
        child: TextField(
          textInputAction: TextInputAction.search,
          textDirection: _currentTextDirection,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              height: ScreenUtil().setHeight(0.6)),
          controller: _searchController,
          decoration: InputDecoration(
            labelText: tr('Search'),
            suffixIcon: isTextFieldActive &&
                        _currentTextDirection == ui.TextDirection.ltr ||
                    isTextFieldActive &&
                        _currentTextDirection == ui.TextDirection.rtl
                ? IconButton(
                    icon: Icon(
                      FontAwesomeIcons.xmark,
                      size: ScreenUtil().setWidth(16),
                    ),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        isTextFieldActive = false;
                      });
                    },
                  )
                : null,
            //
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil().radius(16.0)))),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchCategoriesView(
                    nameCategory: widget.name,
                    searchCAtegoryName: value,
                  );
                }));
                _searchController.clear();
                isTextFieldActive = false;
              });
            } else if (value.isEmpty) {
              setState(() {
                isTextFieldActive = false;
              });
            }
          },
          onChanged: (value) {
            setState(() {
              isTextFieldActive = value.isNotEmpty;
            });
            if (value.isEmpty) {
              setState(() {
                isTextFieldActive = false;
              });
            }
            if (value.contains(RegExp(r'[a-zA-Z]'))) {
              // English language detected
              setState(() {
                _currentTextDirection = ui.TextDirection.ltr;
              });
            } else if (value.contains(RegExp(r'[\u0600-\u06FF]'))) {
              // Arabic language detected
              setState(() {
                _currentTextDirection = ui.TextDirection.rtl;
              });
            }
          },
        ),
      ),
    );
  }
}
