import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/core/color_manager.dart';
import '../../domain/core/style_manager.dart';
import '../../route/app_routing.dart';
import '../core/widgets/app_button.dart';

class Task1StartScreen extends StatelessWidget {
  const Task1StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.raspberry5,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Task 1',
              textAlign: TextAlign.center,
              style: TextStyleManager.h1.copyWith(
                color: ColorsManager.text,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 46.h),
            Text(
              'Sign up for an account and complete your profile',
              textAlign: TextAlign.center,
              style: TextStyleManager.h2.copyWith(
                color: ColorsManager.text,
              ),
            ),
            SizedBox(height: 221.h),
            AppButton(
              text: 'Start Task 1',
              onTap: () {
                context.router.replace(const OnboardRoute());
              },
              appButtonType: AppButtonType.primary,
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }
}
