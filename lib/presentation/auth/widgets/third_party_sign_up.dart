// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../../gen/assets.gen.dart';

class ThirdPartySignUp extends StatelessWidget {
  const ThirdPartySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Sign up with',
            style: TextStyleManager.description.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SocialMediaSignUpButton(
                isFacebook: true,
                onTap: () {},
              ),
              SizedBox(width: 16.w),
              _SocialMediaSignUpButton(
                isFacebook: false,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialMediaSignUpButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isFacebook;
  const _SocialMediaSignUpButton({
    required this.onTap,
    required this.isFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: ColorsManager.plum10,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            if (isFacebook)
              Assets.images.facebook.svg(
                color: const Color(0xff1877F2),
                width: 25.w,
                height: 25.h,
              )
            else
              Assets.images.apple.svg(
                color: ColorsManager.text,
                width: 25.w,
                height: 25.h,
              ),
            SizedBox(width: 4.w),
            Text(
              isFacebook ? 'Facebook' : 'Apple ID',
              style: TextStyleManager.description.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
