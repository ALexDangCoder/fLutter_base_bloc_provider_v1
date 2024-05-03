import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app/app.dart';

part 'app_configuration_bloc.freezed.dart';

part 'app_configuration_event.dart';

part 'app_configuration_state.dart';

class AppConfigurationBloc
    extends Bloc<AppConfigurationEvent, AppConfigurationState> {
  AppConfigurationBloc()
      : super(
          AppConfigurationState(
            lightTheme: ThemeManager.lightTheme,
            darkTheme: ThemeManager.darkTheme,
          ),
        ) {
    PlatformDispatcher.instance.onPlatformBrightnessChanged =
        _onPlatformBrightnessChanged;

    on<_ChangeTheme>(_onChangeTheme);
  }

  void _onPlatformBrightnessChanged() {
    if (state.themeMode == ThemeMode.system) {
      add(const AppConfigurationEvent.changeTheme());
    }
  }

  FutureOr<void> _onChangeTheme(
    _ChangeTheme event,
    Emitter<AppConfigurationState> emit,
  ) async {
    emit(
      state.copyWith(
        themeMode: state.isDarkMode ? ThemeMode.light : ThemeMode.dark,
      ),
    );
  }
}
