import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultSearchEmptyView extends StatelessWidget {
  const ResultSearchEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Image.asset('assets/resulterror.jpg',
              width: double.infinity,
              height: ScreenUtil().setHeight(300),
              fit: BoxFit.cover),
          Text(tr("Sorry, There are'nt found any results about that"),
              // overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 4,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
              )),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
            ),
            height: ScreenUtil().setHeight(50),
            color: Colors.indigo[300],
            child: Text(tr('Try search again'),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20), color: Colors.black)),
          )
        ],
      ),
    );
  }
}
