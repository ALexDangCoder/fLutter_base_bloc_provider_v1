// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../domain/core/locale_keys.dart';
import '../../domain/core/style_manager.dart';
import '../../domain/core/theme_manager.dart';
import '../../injection.dart';
import '../../route/app_routing.dart';
import 'widgets/home_size_info.dart';

// Project imports:

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _keyRed = GlobalKey();
  String containerSize = "";

  String get _containerSize =>
      containerSize.isNotEmpty ? "Container Width Height : $containerSize" : "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeSizeInfo(containerSize: _containerSize),
          Text(
            "Aspect Ratio : ${ScreenUtil().pixelRatio}",
            style: TextStyleManager.label3,
          ),
          Text(
            LocaleKeys.msg.tr(
              namedArgs: {"userName": "Hoang"},
              args: ["All"],
            ),
            style: TextStyleManager.label3,
          ),
          OutlinedButton(
            onPressed: () {
              _getSizes();
            },
            child: Text(
              "Get Size",
              style: TextStyleManager.label3,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              getIt<ThemeManager>().changeTheme();
            },
            child: Text(
              "Change Theme",
              style: TextStyleManager.label3,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              context.router.push(const ListUserRoute());
            },
            child: Text(
              "Move To List User Screen",
              style: TextStyleManager.label3,
            ),
          ),
        ],
      ),
    );
  }

  void _getSizes() {
    final renderBoxRed = _keyRed.currentContext!.findRenderObject();
    final sizeRed = renderBoxRed!.paintBounds.size;
    setState(() {
      containerSize = sizeRed.toString();
    });
  }
}
