import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../core/widgets/common_appbar.dart';

class AccountSetUpScreen extends StatelessWidget {
  const AccountSetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.router.navigateBack();
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            child: Assets.images.directionLeft.svg(),
          ),
        ),
        title: 'Complete profile',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [],
        ),
      ),
    );
  }
}
