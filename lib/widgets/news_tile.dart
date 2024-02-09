import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/WebView/webview.dart';
import 'package:news_app/models/articles_model.dart';

import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final shimmerColor = isDarkMode ? Colors.grey[600] : Colors.grey[300];
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return WebViewShow(
                urlImage: articleModel.urlImage,
              );
            }),
          );
        },
        child: articleModel.image == null &&
                articleModel.description == '[Removed]' &&
                articleModel.title == '[Removed]'
            ? Container()
            : Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    child: articleModel.image == null
                        ? SizedBox(
                            width: double.infinity,
                            height: ScreenUtil().setHeight(180),
                            child: Image.asset('assets/error404.jpg',
                                width: double.infinity, fit: BoxFit.cover),
                          )
                        : CachedNetworkImage(
                            // width: double.infinity,
                            // height: ScreenUtil().setHeight(200),
                            imageUrl: articleModel.image!,
                            progressIndicatorBuilder: (context, url,
                                    downloadProgress) =>
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    brightness: Brightness.dark,
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: isDarkMode
                                        ? ColorFilter.mode(
                                            Colors.grey[600]!, BlendMode.srcIn)
                                        : ColorFilter.mode(
                                            Colors.grey[300]!, BlendMode.srcIn),
                                    child: Shimmer.fromColors(
                                        baseColor: shimmerColor!,
                                        highlightColor: shimmerColor,
                                        direction: ShimmerDirection
                                            .ltr, // Shimmer animation direction (left to right)

                                        child: Container(
                                          width: double.infinity,
                                          height: ScreenUtil().setHeight(180),
                                          decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(
                                            //     ScreenUtil().radius(8.0)),
                                            color: Colors.grey[300],
                                          ),
                                        )),
                                  ),
                                ),
                            errorWidget: (
                              context,
                              url,
                              error,
                            ) =>
                                SizedBox(
                                  width: double.infinity,
                                  height: ScreenUtil().setHeight(180),
                                  child: Image.asset('assets/error404.jpg',
                                      width: double.infinity,
                                      fit: BoxFit.cover),
                                )),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    articleModel.title == null ||
                            articleModel.title == '[Removed]'
                        ? ''
                        : articleModel.title!,
                    textDirection: ui.TextDirection.ltr,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    textDirection: ui.TextDirection.ltr,
                    articleModel.description == null ||
                            articleModel.description == '[Removed]' ||
                            articleModel.description == 'False'
                        ? ''
                        : articleModel.description!,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd', locale)
                        .format(articleModel.publishedAt),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
