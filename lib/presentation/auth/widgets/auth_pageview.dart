import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../../route/app_routing.dart';

part 'auth_tab_item.dart';

class AuthPageview extends StatefulWidget {
  const AuthPageview({super.key});

  @override
  State<AuthPageview> createState() => _AuthPageviewState();
}

class _AuthPageviewState extends State<AuthPageview> {
  bool _signUpActive = true;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        SignUpRoute(),
        LogInRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              goToLoginTab: (_) {
                tabsRouter.setActiveIndex(1);
              },
              orElse: () {},
            );
          },
          child: Column(
            children: [
              Container(
                height: 56.h,
                color: ColorsManager.raspberry10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTabItem(
                      isSignUp: true,
                      isActive: _signUpActive,
                      onTap: () {
                        if (!_signUpActive) {
                          setState(() {
                            _signUpActive = true;
                          });
                        }
                        tabsRouter.setActiveIndex(0);
                      },
                    ),
                    AuthTabItem(
                      isSignUp: false,
                      isActive: !_signUpActive,
                      onTap: () {
                        if (_signUpActive) {
                          setState(() {
                            _signUpActive = false;
                          });
                        }
                        tabsRouter.setActiveIndex(1);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
