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
    late final double? width;
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

    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: isActive ? onTap : null,
        style: TextButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor,
          side: border,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
