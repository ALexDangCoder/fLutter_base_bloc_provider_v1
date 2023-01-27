import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';

class AppOptionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double horizontalPadding;
  final bool isFilled;
  const AppOptionButton({
    required this.onTap,
    required this.text,
    required this.horizontalPadding,
    super.key,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isFilled ? ColorsManager.raspberry100 : ColorsManager.white,
          border: Border.all(
            color: isFilled ? ColorsManager.white : ColorsManager.raspberry100,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Text(
          text,
          style: TextStyleManager.paragraph.copyWith(
            fontWeight: FontWeight.w300,
            color: isFilled ? ColorsManager.white : ColorsManager.raspberry100,
          ),
        ),
      ),
    );
  }
}
