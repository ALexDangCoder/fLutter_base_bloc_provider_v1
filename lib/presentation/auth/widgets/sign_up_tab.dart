import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_textfield.dart';
import 'term_of_services.dart';
import 'third_party_sign_up.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({super.key});

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab>
    with AutomaticKeepAliveClientMixin {
  String _signUpName = '';
  String _phoneNumber = '';
  bool _tocAccepted = false;
  bool _canSignUp = false;

  @override
  void initState() {
    super.initState();
    debugPrint('init');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  const ThirdPartySignUp(),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorsManager.divider,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Text(
                        'or',
                        style: TextStyleManager.description.copyWith(
                          color: ColorsManager.cueText,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      SizedBox(
                        width: 120.w,
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorsManager.divider,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    label: 'Name',
                    hintText: 'Enter your full name',
                    maxLength: 256,
                    onChanged: (value) {
                      _signUpName = value;
                      _verifySignUpConditions();
                    },
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    label: 'Mobile number',
                    hintText: 'Enter your mobile number',
                    prefixText: '+855  |   ',
                    numberOnly: true,
                    maxLength: 9,
                    onChanged: (value) {
                      _phoneNumber = value;
                      _verifySignUpConditions();
                    },
                  ),
                ],
              ),
            ),
          ),
          TermOfServices(
            onBoxTickTap: (status) {
              setState(() {
                _tocAccepted = status;
              });
              _verifySignUpConditions();
            },
          ),
          AppButton(
            text: 'Next',
            onTap: () {},
            appButtonType: AppButtonType.primary,
            isActive: _canSignUp,
          ),
          SizedBox(height: 16.h),
          Text.rich(
            style: TextStyleManager.description.copyWith(
              fontWeight: FontWeight.w400,
              color: ColorsManager.text,
            ),
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                const TextSpan(text: 'Already have an account?'),
                WidgetSpan(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.read<AuthBloc>().add(
                            AuthEvent.goToLoginTab(
                              requestTime: DateTime.now(),
                            ),
                          );
                    },
                    child: Text(
                      ' Log in',
                      style: TextStyleManager.description.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorsManager.raspberry100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 21.h),
        ],
      ),
    );
  }

  void _verifySignUpConditions() {
    final signUpAvailable =
        _tocAccepted && _signUpName.isNotEmpty && _phoneNumber.length >= 8;
    if (signUpAvailable != _canSignUp) {
      setState(() {
        _canSignUp = signUpAvailable;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
