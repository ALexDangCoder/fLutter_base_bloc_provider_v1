import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../gen/assets.gen.dart';

class AppFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  const AppFloatingActionButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64.w,
        height: 64.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsManager.orange100,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.r,
              offset: Offset(1.w, 1.h),
              color: Colors.black.withOpacity(0.16),
            ),
          ],
        ),
        child: Assets.images.newPost.svg(
          width: 21.r,
          height: 21.r,
          color: ColorsManager.orange10,
        ),
      ),
    );
  }
}
