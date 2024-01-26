import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.dart';
import 'bloc/list_user_bloc.dart';
import 'ui/list_user_screen.dart';

class ListUserRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) =>
          getIt<ListUserBloc>()..add(const ListUserEvent.get()),
      child: const ListUserScreen(),
    );
  }
}
