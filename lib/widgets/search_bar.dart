import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/view/search_page.dart';
import 'dart:ui' as ui;

class SearchOfBar extends StatefulWidget {
  const SearchOfBar({
    super.key,
  });

  @override
  State<SearchOfBar> createState() => _SearchOfBarState();
}

class _SearchOfBarState extends State<SearchOfBar> {
  final TextEditingController _searchController = TextEditingController();
  bool isTextFieldActive = false;
  ui.TextDirection? _currentTextDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(40),
      child: TextField(
        autofocus: true,
        textInputAction: TextInputAction.search,
        autocorrect: true,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            height: ScreenUtil().setHeight(0.75)),
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
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(ScreenUtil().radius(16)))),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchView(
                  searchName: value,
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
        textDirection: _currentTextDirection,
      ),
    );
  }
}
