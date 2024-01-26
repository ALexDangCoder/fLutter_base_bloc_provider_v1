import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.dart';
import 'ui/detail_screen.dart';

class DetailRoute extends GoRouteData {
  const DetailRoute({required this.index});

  final int index;

  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      NavigationUtil.rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailScreen(index: index);
  }
}
