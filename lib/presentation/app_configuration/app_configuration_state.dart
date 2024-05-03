part of 'app_configuration_bloc.dart';

@freezed
class AppConfigurationState with _$AppConfigurationState {
  const factory AppConfigurationState({
    required ThemeData lightTheme,
    required ThemeData darkTheme,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppConfigurationState;
}

extension AppConfigurationStateX on AppConfigurationState {
  bool get isDarkMode {
    switch (themeMode) {
      case ThemeMode.system:
        return platformBrightness == Brightness.dark;
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
    }
  }

  bool get isLightMode => !isDarkMode;

  Brightness get platformBrightness =>
      PlatformDispatcher.instance.platformBrightness;

  ThemeData get themeData => isDarkMode ? darkTheme : lightTheme;
}
