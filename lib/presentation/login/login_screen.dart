// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../application/auth/auth_bloc.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/core/constant_manager.dart';
import '../../domain/core/style_manager.dart';
import '../../gen/assets.gen.dart';
import '../../injection.dart';
import 'widgets/login_screen_info.dart';

// Project imports:

class LoginScreen extends StatefulWidget with AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // state.when;
        // switch (state.runtimeType) {
        //   case LoginSuccessState:
        //     LoadingDialog.hideLoadingDialog;
        //     context.router.push(const HomeRoute());
        //     break;
        //   case LoginErrorState:
        //     LoadingDialog.hideLoadingDialog;
        //     break;
        //   case LoginLoadingState:
        //     LoadingDialog.showLoadingDialog(context);
        //     break;
        // }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginScreenInfo(),
              MaterialButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthEvent.login(
                          emailAddress: EmailAddress("userName@gmail.com"),
                          password: Password("password"),
                        ),
                      );
                },
                color: Colors.green,
                padding: EdgeInsets.all(PaddingManager.p8),
                child: Text(
                  "Login",
                  style: TextStyleManager.h1,
                ),
              ),
              SizedBox(height: SizeManager.s10),
              MaterialButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthEvent.login(
                          emailAddress: EmailAddress("userName"),
                          password: Password("password"),
                        ),
                      );
                },
                color: Colors.red,
                padding: EdgeInsets.all(PaddingManager.p8),
                child: Text(
                  "Login Error",
                  style: TextStyleManager.h1,
                ),
              ),
              SizedBox(height: SizeManager.s10),
              MaterialButton(
                onPressed: () async {
                  context.setLocale(const Locale("vi", "VN"));
                  log("Result : ${Intl.getCurrentLocale()}");
                  setState(() {});
                },
                color: Colors.blue,
                padding: EdgeInsets.all(PaddingManager.p8),
                child: Text(
                  "Change Locale to Viet Nam",
                  textAlign: TextAlign.center,
                  style: TextStyleManager.h1,
                ),
              ),
              Assets.images.cashIcon1.svg(),
            ],
          ),
        );
      },
    );
  }
}
