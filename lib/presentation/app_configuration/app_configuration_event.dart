part of 'app_configuration_bloc.dart';

@freezed
class AppConfigurationEvent with _$AppConfigurationEvent {
  const factory AppConfigurationEvent.changeTheme() = _ChangeTheme;
}
