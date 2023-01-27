import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

class TextStyleManager {
  static TextStyle get h1 {
    return TextStyle(
      fontSize: 24.sp,
      height: 36.h / 24.sp,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get h2 {
    return TextStyle(
      fontSize: 20.sp,
      height: 30.h / 20.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get h3 {
    return TextStyle(
      fontSize: 18.sp,
      height: 27.h / 18.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get title {
    return TextStyle(
      fontSize: 18.sp,
      height: 24.h / 18.sp,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get subtitle {
    return TextStyle(
      fontSize: 16.sp,
      height: 24.h / 16.sp,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get paragraph {
    return TextStyle(
      fontSize: 16.sp,
      height: 24.h / 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get description {
    return TextStyle(
      fontSize: 14.sp,
      height: 19.h / 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get fineText {
    return TextStyle(
      fontSize: 12.sp,
      height: 18.h / 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get textfieldError {
    return TextStyle(
      fontSize: 12.sp,
      height: 16.34.h / 12.sp,
      color: ColorsManager.error100,
    );
  }
}
