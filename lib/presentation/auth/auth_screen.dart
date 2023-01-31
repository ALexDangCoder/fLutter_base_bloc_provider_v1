import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/auth/auth_bloc.dart';
import '../../domain/core/common_operations.dart';
import '../../gen/assets.gen.dart';
import '../../injection.dart';
import 'widgets/auth_pageview.dart';

class AuthScreen extends StatelessWidget with AutoRouteWrapper {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          CommonOperations.dismissKeyboard(context);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 52.h),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Assets.images.authGreeting.svg(
                    height: 182.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 8.h),
                  const Expanded(
                    child: SafeArea(
                      top: false,
                      child: AuthPageview(),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 27.w),
                  width: 40.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  child: Assets.images.directionLeft.svg(
                    height: 12.h,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => getIt<AuthBloc>(), child: this);
  }
}
