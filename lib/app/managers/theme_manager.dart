part of '../app.dart';

abstract class ThemeManager {
  // DO NOT USE textButtonTheme, it will cause lot of rebuilds
  // link issue https://github.com/flutter/flutter/issues/89127
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.light(
      background: ColorsManager.white,
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    brightness: Brightness.light,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
      labelLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
      headlineLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
      displayLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
      titleLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.dark(background: ColorsManager.black),
    scaffoldBackgroundColor: ColorsManager.black,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
      labelLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
      headlineLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
      displayLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
      titleLarge: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
    ),
  );
}
