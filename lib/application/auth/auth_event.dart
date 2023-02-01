part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required EmailAddress emailAddress,
    required Password password,
  }) = _LoginEvent;
  const factory AuthEvent.goToLoginTab({
    required DateTime requestTime,
  }) = _GoToLoginTabEvent;
  const factory AuthEvent.formatOtpPhoneNumber({
    required String phoneNumber,
  }) = _FormatOtpPhoneNumberEvent;
}
