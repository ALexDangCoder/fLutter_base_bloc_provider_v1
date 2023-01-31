import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/list_user/list_user_screen.dart';
import '../../presentation/login/login_screen.dart';
import '../presentation/onboard/onboard_screen.dart';
import '../presentation/auth/auth_screen.dart';
import '../presentation/task_1_start/task_1_start_screen.dart';

part 'app_routing.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: Task1StartScreen, initial: true),
    AutoRoute(page: OnboardScreen),
    AutoRoute(page: AuthScreen),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ListUserScreen),
  ],
)
class AppRouter extends _$AppRouter {}
