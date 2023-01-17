import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/list_user/ui/list_user_screen.dart';
import '../../presentation/login/ui/login_screen.dart';

part 'app_routing.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ListUserScreen),
  ],
)
class AppRouter extends _$AppRouter {}
