import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/value_objects.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade authFacade;
  AuthBloc({required this.authFacade}) : super(const _Initial()) {
    on<AuthEvent>((event, emit) {
      event.when(
        login: (emailAddress, password) async {
          final result = await authFacade.signInWithEmailAndPassword(
            emailAddress: emailAddress,
            password: password,
          );
          result.fold(
            (l) => emit(
              const AuthState.error(message: 'cannot log in at the moment'),
            ),
            (r) => null,
          );
        },
        goToLoginTab: (requestTime) {
          emit(AuthState.goToLoginTab(requestTime: requestTime));
        },
        formatOtpPhoneNumber: (phoneNumber) {
          final formatted = '+855 ${phoneNumber.substring(0, 2)} '
              '${phoneNumber.substring(2, 5)} ${phoneNumber.substring(5)} ';
          emit(AuthState.formatOtpPhoneNumber(phoneNumber: formatted));
        },
      );
    });
  }
}
