import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final shimmerColor = isDarkMode ? Colors.grey[600] : Colors.grey[200];
    return ColorFiltered(
      colorFilter: isDarkMode
          ? ColorFilter.mode(Colors.grey[600]!, BlendMode.srcIn)
          : ColorFilter.mode(Colors.grey[200]!, BlendMode.srcIn),
      child: Shimmer.fromColors(
        direction:
            ShimmerDirection.ltr, // Shimmer animation direction (left to right)
        baseColor: shimmerColor!,
        highlightColor: shimmerColor,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(8.0)),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
