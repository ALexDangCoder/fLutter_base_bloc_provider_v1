import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/core/color_manager.dart';
import '../../domain/core/style_manager.dart';
import '../../gen/assets.gen.dart';
import '../../route/app_routing.dart';
import '../core/widgets/app_button.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.raspberry5,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 75.h),
          Text(
            'Pregnancy',
            style: TextStyleManager.h1.copyWith(
              color: ColorsManager.raspberry100,
              fontWeight: FontWeight.w600,
              height: 32.69.h / 24.sp,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '2',
                style: TextStyleManager.h2.copyWith(
                  color: ColorsManager.plum100,
                  height: 27.24.h / 20.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Preschool',
                style: TextStyleManager.h2.copyWith(
                  color: ColorsManager.raspberry100,
                  height: 27.24.h / 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 94.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Image.asset(
              Assets.images.onboardPStage.path,
              width: 336.w,
              height: 219.h,
            ),
          ),
          SizedBox(height: 48.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w),
            child: Text(
              'Taking care of all your pregnancy needs',
              textAlign: TextAlign.center,
              style: TextStyleManager.h2.copyWith(
                color: ColorsManager.plum100,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: AppButton(
              text: 'Let’s go!',
              onTap: () {
                context.router.replace(const AuthRoute());
              },
              appButtonType: AppButtonType.primary,
            ),
          ),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }
}
