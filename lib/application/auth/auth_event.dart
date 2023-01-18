part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required EmailAddress emailAddress,
    required Password password,
  }) = _LoginEvent;
}
