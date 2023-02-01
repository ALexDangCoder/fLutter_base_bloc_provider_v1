part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _LoadingState;
  const factory AuthState.error({required String message}) = _ErrorState;
  const factory AuthState.authenticated() = _AuthenticatedState;
  const factory AuthState.unauthenticated() = _UnauthenticatedState;
  const factory AuthState.goToLoginTab({
    required DateTime requestTime,
  }) = _GoToLoginTabState;
  const factory AuthState.formatOtpPhoneNumber({
    required String phoneNumber,
  }) = _FormatOtpPhoneNumberState;
}
