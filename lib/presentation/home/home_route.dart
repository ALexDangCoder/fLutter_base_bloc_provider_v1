import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'ui/home_screen.dart';

class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}
