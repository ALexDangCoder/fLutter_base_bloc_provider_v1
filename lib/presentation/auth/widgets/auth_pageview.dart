import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/core/color_manager.dart';
import '../../../domain/core/common_operations.dart';
import '../../../domain/core/style_manager.dart';
import 'log_in_tab.dart';
import 'sign_up_tab.dart';

part 'auth_tab_item.dart';

class AuthPageview extends StatefulWidget {
  const AuthPageview({super.key});

  @override
  State<AuthPageview> createState() => _AuthPageviewState();
}

class _AuthPageviewState extends State<AuthPageview> {
  bool _signUpActive = true;
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          goToLoginTab: (_) {
            _controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
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
                      _controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
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
                      _controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 2,
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  _signUpActive = value == 0;
                });
                CommonOperations.dismissKeyboard(context);
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SignUpTab();
                }

                return const LogInTab();
              },
            ),
          ),
        ],
      ),
    );
  }
}
