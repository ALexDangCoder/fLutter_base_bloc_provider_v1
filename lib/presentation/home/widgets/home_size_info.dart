import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/style_manager.dart';

class HomeSizeInfo extends StatefulWidget {
  const HomeSizeInfo({
    required this.containerSize,
    Key? key,
  });

  final String containerSize;

  @override
  State<HomeSizeInfo> createState() => _HomeSizeInfoState();
}

class _HomeSizeInfoState extends State<HomeSizeInfo> {
  final GlobalKey _keyRed = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _keyRed,
      width: 375.w,
      height: 500.h,
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.blue)),
        color: Colors.red,
      ),
      child: Text(
        "Screen Width : ${ScreenUtil().screenWidth}  Height : ${ScreenUtil().screenHeight}"
        "\n${widget.containerSize} "
        "\nWidth Ratio : ${ScreenUtil().scaleWidth} "
        "\nHeight Ratio : ${ScreenUtil().scaleHeight} "
        "\nText Ratio : ${ScreenUtil().scaleText} "
        "\n$defaultTargetPlatform",
        style: TextStyleManager.h1,
      ),
    );
  }
}
