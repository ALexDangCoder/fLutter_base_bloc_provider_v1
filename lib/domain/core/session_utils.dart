import 'package:flutter/material.dart';

import 'shared_pref_manager.dart';
import 'theme_manager.dart';
import '../../injection.dart';

class SessionUtils {
  static bool get isDarkTheme =>
      getIt<ThemeManager>().currentTheme == ThemeMode.dark;

  static void saveAccessToken(String accessToken) =>
      getIt<SharedPreferencesManager>().putString(
        SharedPreferenceKey.keyAccessToken,
        accessToken,
      );
}
