import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';

PreferredSize commonAppbar({
  Widget? leading,
  String? title,
  Widget? trailing,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100.h),
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: ColorsManager.gradient,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 56.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leading ?? SizedBox(width: 40.w),
                  if (title != null)
                    Text(
                      title,
                      style: TextStyleManager.h3.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  trailing ?? SizedBox(width: 40.w),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
