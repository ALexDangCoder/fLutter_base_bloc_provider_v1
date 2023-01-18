// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../app/app.dart';
import '../../../app/di/injection.dart';
import '../../../app/managers/constant_manager.dart';
import '../../../app/multi-languages/multi_languages_utils.dart';
import '../../../app/route/app_routing.dart';
import '../../../application/login_bloc/login_bloc.dart';
import '../../../domain/login/repositories/login_repository.dart';
import '../../../domain/login/usecases/login_usecase.dart';
import '../../../gen/assets.gen.dart';
import '../../core/dialog/loading_dialog.dart';

// Project imports:

class LoginScreen extends StatefulWidget with AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginUseCase(getIt<LoginRepository>())),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        switch (state.runtimeType) {
          case LoginSuccessState:
            LoadingDialog.hideLoadingDialog;
            context.router.push(const HomeRoute());
            break;
          case LoginErrorState:
            LoadingDialog.hideLoadingDialog;
            break;
          case LoginLoadingState:
            LoadingDialog.showLoadingDialog(context);
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Login Screen ${LocaleKeys.title.tr()} ${Intl.getCurrentLocale()} ${ConfigManager.getInstance()!.appFlavor}",
                  style: TextStyleManager.label3,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginPressed("userName", "password", false),
                      );
                },
                color: Colors.green,
                padding: EdgeInsets.all(PaddingManager.p8),
                child: Text(
                  "Login",
                  style: TextStyleManager.label3,
                ),
              ),
              SizedBox(height: SizeManager.s10),
              MaterialButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginPressed(
                          "userName",
                          "password",
                          true,
                        ),
                      );
                },
                color: Colors.red,
                padding: EdgeInsets.all(PaddingManager.p8),
                child: Text(
                  "Login Error",
                  style: TextStyleManager.label3,
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
                  style: TextStyleManager.label3,
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
