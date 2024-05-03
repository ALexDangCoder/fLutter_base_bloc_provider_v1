import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/managers/constant_manager.dart';
import '../../../app/multi-languages/multi_languages_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../common/dialog/loading_dialog.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case LoginStateStatus.success:
            LoadingDialog.hideLoadingDialog;
            Navigator.pushNamed(context, RouteDefine.homeScreen.name);
            break;
          case LoginStateStatus.error:
            LoadingDialog.hideLoadingDialog;
            break;
          case LoginStateStatus.loading:
            LoadingDialog.showLoadingDialog(context);
            break;
          default:
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
                  "Login Screen ${LocaleKeys.title.tr()} ${Intl.getCurrentLocale()} ${ConfigManager.getInstance().appFlavor}",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginEvent.logInPressed(
                          "userName",
                          "password",
                          false,
                        ),
                      );
                },
                color: Colors.green,
                padding: EdgeInsets.all(PaddingManager.p8),
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: SizeManager.s10),
              MaterialButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginEvent.logInPressed(
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
                  style: Theme.of(context).textTheme.displayLarge,
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
                  style: Theme.of(context).textTheme.displayLarge,
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
