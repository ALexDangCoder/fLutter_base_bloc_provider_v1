import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';

enum AppButtonType { primary, secondary, text }

enum AppButtonLength { long, short, mini }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final AppButtonType appButtonType;

  /// Not applicable when [appButtonType] is [AppButtonType.text]
  final AppButtonLength appButtonLength;

  /// Only applicable when [appButtonType] is [AppButtonType.primary]
  final bool isActive;

  final Color? color;

  const AppButton({
    required this.text,
    required this.onTap,
    required this.appButtonType,
    this.appButtonLength = AppButtonLength.long,
    this.isActive = true,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final double? width;
    final primaryColor = color ?? ColorsManager.raspberry100;
    switch (appButtonLength) {
      case AppButtonLength.long:
        width = double.infinity;
        break;
      case AppButtonLength.short:
        width = 160.w;
        break;
      case AppButtonLength.mini:
        width = null;
        break;
    }
    final padding = appButtonType == AppButtonType.text
        ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h)
        : EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h);
    final backgroundColor = appButtonType == AppButtonType.primary
        ? isActive
            ? primaryColor
            : ColorsManager.divider
        : ColorsManager.white;
    final borderColor = appButtonType == AppButtonType.secondary
        ? primaryColor
        : ColorsManager.white;
    final textColor = appButtonType == AppButtonType.primary
        ? isActive
            ? ColorsManager.white
            : ColorsManager.cueText
        : primaryColor;
    final textStyle = appButtonType == AppButtonType.text
        ? TextStyleManager.description.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.normal,
          )
        : TextStyleManager.paragraph.copyWith(color: textColor);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
