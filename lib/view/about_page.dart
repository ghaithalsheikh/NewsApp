import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset('assets/about2.jpg',
              width: double.infinity,
              height: ScreenUtil().setHeight(300),
              fit: BoxFit.cover),
          Icon(
            Icons.download_for_offline_rounded,
            size: ScreenUtil().setWidth(150),
            color: Colors.grey,
          ),
          Center(
              child: Text(
            tr('Latest Version 1.0.0'),
            style: TextStyle(fontSize: ScreenUtil().setSp(24)),
          ))
        ],
      ),
    );
  }
}
