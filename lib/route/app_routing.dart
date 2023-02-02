import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/list_user/list_user_screen.dart';
import '../presentation/account_set_up/account_setup_screen.dart';
import '../presentation/account_set_up/sub_screens/account_set_up_start_screen.dart';
import '../presentation/auth/widgets/log_in_screen.dart';
import '../presentation/auth/widgets/sign_up_screen.dart';
import '../presentation/onboard/onboard_screen.dart';
import '../presentation/auth/auth_screen.dart';
import '../presentation/task_1_start/task_1_start_screen.dart';

part 'app_routing.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: Task1StartScreen, initial: true),
    AutoRoute(page: OnboardScreen),
    AutoRoute(
      page: AuthScreen,
      children: [
        AutoRoute(page: SignUpScreen, initial: true),
        AutoRoute(page: LogInScreen),
      ],
    ),
    AutoRoute(
      page: EmptyRouterScreen,
      name: 'AccountSetUpStartRouter',
      path: '/account-set-up-start',
      children: [
        AutoRoute(page: AccountSetUpStartScreen, initial: true),
        AutoRoute(page: AccountSetUpScreen),
      ],
    ),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ListUserScreen),
  ],
)
class AppRouter extends _$AppRouter {}
