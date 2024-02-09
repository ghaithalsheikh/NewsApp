import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/view/about_page.dart';
import 'package:news_app/view/category_page.dart';
import 'package:news_app/view/contact_page.dart';
import 'package:news_app/view/setting_page.dart';
import 'package:news_app/provider/provider_nameLanguage.dart';
import 'package:news_app/viewmodel/viewmodel_news.dart';
import 'package:news_app/widgets/custom_dropdown.dart';
import 'package:news_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../widgets/news_listview_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  dynamic future;
  String? selectedOption; // Variable to store the selected option

  Future<void> _refreshData() async {
    final langName = Provider.of<ProviderNameLanguage>(context).nameLanguage;
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      future =
          NewsViewModel().fetchNews(categoryName: 'general', lang: langName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              tr("News"),
              style: TextStyle(fontSize: ScreenUtil().setSp(24)),
            ),
            Text(
              tr('World'),
              style: TextStyle(
                  color: Colors.orange, fontSize: ScreenUtil().setSp(24)),
            ),
            const Spacer(
              flex: 4,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppBar(
                              title: Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setWidth(5)),
                                child: const SearchOfBar(),
                              ),
                            )));
              },
              icon: const Icon(Icons.search),
              iconSize: ScreenUtil().setWidth(26),
            )
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              child: Container(),
            ),
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Icon(
                  Icons.category_outlined,
                  size: ScreenUtil().setWidth(33),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(30),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconSize: 0,
                    elevation: 0,
                    alignment: Alignment.center,
                    hint: Text(
                      tr('Categoreis News'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: ScreenUtil().setSp(19)),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        if (newValue == selectedOption) {
                          selectedOption =
                              null; // Cancel the selection if it's the same value
                        } else {
                          selectedOption =
                              newValue; // Update the selected option
                        }
                      });
                    },
                    items: [
                      CustomDropdownMenuItem<String>(
                        value: tr('Technology'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryView(
                                  name: 'Technology',
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          tr('Technology'),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Sports',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryView(
                                  name: 'Sports',
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          tr('Sports'),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Business',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryView(
                                  name: 'Business',
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          tr('Business'),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'entertainment',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryView(
                                  name: 'entertainment',
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          tr('entertainment'),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'health',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryView(
                                  name: 'health',
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          tr('health'),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Science',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryView(
                                  name: 'Science',
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          tr('Science'),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Icon(
                    Icons.settings,
                    size: ScreenUtil().setWidth(33),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    tr('Setting'),
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingView();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Icon(
                    Icons.share_outlined,
                    size: ScreenUtil().setWidth(33),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    tr('Sharing'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AboutView();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Icon(
                    Icons.info_outline,
                    size: ScreenUtil().setWidth(33),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    tr('About'),
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AboutView();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Icon(
                    FontAwesomeIcons.commentDots,
                    size: ScreenUtil().setWidth(33),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    tr('Contact Us'),
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ContactUsView();
                    },
                  ),
                );
              },
            ),
            //
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(10.0)),
          child: CustomScrollView(
            slivers: [
              NewsListViewBuilder(
                categoryName: 'general',
                future: future,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
