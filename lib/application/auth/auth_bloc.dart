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
      );
    });
  }
}
