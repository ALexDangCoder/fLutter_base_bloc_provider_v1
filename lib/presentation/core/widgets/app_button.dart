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

  const AppButton({
    required this.text,
    required this.onTap,
    required this.appButtonType,
    this.appButtonLength = AppButtonLength.long,
    this.isActive = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding;
    final backgroundColor = appButtonType == AppButtonType.primary
        ? isActive
            ? ColorsManager.raspberry100
            : ColorsManager.divider
        : ColorsManager.white;
    final border = appButtonType == AppButtonType.secondary
        ? const BorderSide(color: ColorsManager.raspberry100)
        : null;
    final textColor = appButtonType == AppButtonType.primary
        ? isActive
            ? ColorsManager.white
            : ColorsManager.cueText
        : ColorsManager.raspberry100;
    final textStyle = appButtonType == AppButtonType.text
        ? TextStyleManager.description.copyWith(
            color: ColorsManager.raspberry100,
            fontWeight: FontWeight.normal,
          )
        : TextStyleManager.paragraph.copyWith(color: textColor);

    if (appButtonType == AppButtonType.text) {
      padding = EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h);
    } else {
      switch (appButtonLength) {
        case AppButtonLength.long:
          padding = EdgeInsets.symmetric(horizontal: 123.w, vertical: 8.h);
          break;
        case AppButtonLength.short:
          padding = EdgeInsets.symmetric(horizontal: 35.w, vertical: 8.h);
          break;
        case AppButtonLength.mini:
          padding = EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h);
          break;
      }
    }

    return TextButton(
      onPressed: isActive ? onTap : null,
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        side: border,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
