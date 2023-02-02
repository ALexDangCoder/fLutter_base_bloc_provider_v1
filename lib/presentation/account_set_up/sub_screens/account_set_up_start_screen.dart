import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../../gen/assets.gen.dart';
import '../../../route/app_routing.dart';
import '../../core/widgets/app_button.dart';

class AccountSetUpStartScreen extends StatelessWidget {
  final String userName;
  const AccountSetUpStartScreen({
    this.userName = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.raspberry5,
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 68.h),
              Text(
                'Hey $userName!',
                style: TextStyleManager.h1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.orange100,
                ),
              ),
              Text(
                'Welcome to P2P',
                style: TextStyleManager.h2.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.raspberry100,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'The following are a few questions that will help us customize your experience.',
                style: TextStyleManager.paragraph.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 94.h),
              Image.asset(
                Assets.images.profileHello.path,
                fit: BoxFit.fitWidth,
              ),
              const Spacer(),
              AppButton(
                text: 'Let’s go!',
                onTap: () {
                  context.router.navigate(const AccountSetUpRoute());
                },
                appButtonType: AppButtonType.primary,
              ),
              SizedBox(height: 8.h),
              AppButton(
                text: 'Close',
                onTap: () {},
                appButtonType: AppButtonType.text,
              ),
              SizedBox(height: 13.h),
            ],
          ),
        ),
      ),
    );
  }
}
