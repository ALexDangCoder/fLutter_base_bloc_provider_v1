import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/app.dart';
import '../../../app/multi-languages/multi_languages_utils.dart';
import '../../app_configuration/app_configuration_bloc.dart';

// Project imports:

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
          Container(
            key: _keyRed,
            width: 375.w,
            height: 500.h,
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.blue)),
              color: Colors.red,
            ),
            child: Text(
              "Screen Width : ${ScreenUtil().screenWidth}  Height : ${ScreenUtil().screenHeight}"
              "\n$_containerSize "
              "\nWidth Ratio : ${ScreenUtil().scaleWidth} "
              "\nHeight Ratio : ${ScreenUtil().scaleHeight} "
              "\nText Ratio : ${ScreenUtil().scaleText} "
              "\n$defaultTargetPlatform",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Text(
            "Aspect Ratio : ${ScreenUtil().pixelRatio}",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            LocaleKeys.msg.tr(
              namedArgs: {"userName": "Hoang"},
              args: ["All"],
            ),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          OutlinedButton(
            onPressed: () {
              _getSizes();
            },
            child: Text(
              "Get Size",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              context
                  .read<AppConfigurationBloc>()
                  .add(const AppConfigurationEvent.changeTheme());
            },
            child: Text(
              "Change Theme",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteDefine.listUserScreen.name);
            },
            child: Text(
              "Move To List User Screen",
              style: Theme.of(context).textTheme.displayLarge,
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
