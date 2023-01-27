import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'color_manager.dart';

@lazySingleton
class ThemeManager with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: ColorsManager.white,
      scaffoldBackgroundColor: ColorsManager.white,
      brightness: Brightness.light,
      fontFamily: 'NotoSans',
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: ColorsManager.raspberry10,
      scaffoldBackgroundColor: ColorsManager.raspberry100,
      brightness: Brightness.dark,
      fontFamily: 'NotoSans',
    );
  }
}
