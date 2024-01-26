import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.dart';
import '../detail/detail_route.dart';
import '../home/home_route.dart';
import '../list_user/list_user_route.dart';
import 'ui/main_screen.dart';

part 'main_route.g.dart';

@TypedShellRoute<MainRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<ListUserRoute>(
      path: '/listUser',
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<DetailRoute>(path: ':index'),
      ],
    ),
  ],
)
class MainRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey =
      NavigationUtil.shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainScreen(child: navigator);
  }
}
