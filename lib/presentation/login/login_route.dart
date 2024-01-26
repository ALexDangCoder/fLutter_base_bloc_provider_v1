import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.dart';
import '../../domain/login/repositories/login_repository.dart';
import '../../domain/login/usecases/login_usecase.dart';
import 'bloc/login_bloc.dart';
import 'ui/login_screen.dart';

part 'login_route.g.dart';

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => LoginBloc(
        LoginUseCase(
          getIt<LoginRepository>(),
        ),
      ),
      child: const LoginScreen(),
    );
  }
}
