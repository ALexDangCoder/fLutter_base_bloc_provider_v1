import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/common_operations.dart';
import '../../../domain/core/style_manager.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_textfield.dart';
import '../../otp/dialog/show_otp.dart';
import 'term_of_services.dart';
import 'third_party_sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _signUpName = '';
  String _phoneNumber = '';
  bool _tocAccepted = false;
  bool _canSignUp = false;

  // TODO: remove placeholder _duplicatePhoneNumber
  final _duplicatePhoneNumber = '12345678';

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

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
            onTap: () {
              if (!_canSignUp) return;

              if (_phoneNumber == _duplicatePhoneNumber) {
                if (Platform.isAndroid) {
                  _showAndroidAlert(context);
                } else {
                  _showIOSAlert(context);
                }
              } else {
                CommonOperations.dismissKeyboard(context);
                showOtp(context, phoneNumber: _phoneNumber);
              }
            },
            appButtonType: AppButtonType.primary,
            isActive: _canSignUp,
          ),
          SizedBox(height: 16.h),
          Text.rich(
            style: TextStyleManager.description.copyWith(
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                const TextSpan(text: 'Already have an account?'),
                WidgetSpan(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      tabsRouter.setActiveIndex(1);
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

  void _showAndroidAlert(BuildContext screenContext) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Mobile number already exists. '
            'Would you like to Log In this existing account or sign up with another number?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: call login and go to otp
                showOtp(context, phoneNumber: _phoneNumber);
              },
              child: const Text('Log In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Use another phone number'),
            ),
          ],
        );
      },
    );
  }

  void _showIOSAlert(BuildContext screenContext) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Mobile number already exists. '
            'Would you like to Log In this existing account or sign up with another number?',
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: call login and go to otp
                showOtp(context, phoneNumber: _phoneNumber);
              },
              child: const Text('Log In'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Use another phone number'),
            ),
          ],
        );
      },
    );
  }
}
