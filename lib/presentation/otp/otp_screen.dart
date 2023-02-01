import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/auth/auth_bloc.dart';
import '../../domain/core/color_manager.dart';
import '../../domain/core/common_operations.dart';
import '../../domain/core/style_manager.dart';
import '../core/widgets/app_button.dart';
import 'widgets/otp_field.dart';
import 'widgets/otp_resend_button.dart';

class OtpScreen extends StatefulWidget {
  final BuildContext parentContext;
  final String phoneNumber;
  const OtpScreen({
    required this.phoneNumber,
    required this.parentContext,
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _formattedPhoneNumber = '';
  String _otp = '';

  @override
  void initState() {
    super.initState();
    context
        .read<AuthBloc>()
        .add(AuthEvent.formatOtpPhoneNumber(phoneNumber: widget.phoneNumber));
  }

  @override
  Widget build(BuildContext context) {
    bool signUpAvailable = _otp.length == 6;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          formatOtpPhoneNumber: (phoneNumber) {
            _formattedPhoneNumber = phoneNumber;
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        if (_formattedPhoneNumber.isEmpty) return const SizedBox();

        return SafeArea(
          top: false,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              CommonOperations.dismissKeyboard(context);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    'Input OTP',
                    style: TextStyleManager.paragraph.copyWith(
                      color: ColorsManager.text,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Please enter the 6-digit OTP sent to '
                    '$_formattedPhoneNumber within 10 minutes. '
                    'Try resending the OTP if you didn’t get it.',
                    style: TextStyleManager.description.copyWith(
                      fontWeight: FontWeight.normal,
                      color: ColorsManager.text,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  OtpField(
                    onChanged: (otp) {
                      _otp = otp;
                    },
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const OtpResendButton(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 8.h, 0, 8.h),
                        child: Text(
                          'Sign up with other methods',
                          style: TextStyleManager.description.copyWith(
                            fontWeight: FontWeight.normal,
                            color: ColorsManager.raspberry100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppButton(
                    text: 'Sign up',
                    onTap: () {
                      Navigator.of(context).pop(_otp);
                    },
                    appButtonType: AppButtonType.primary,
                    isActive: signUpAvailable,
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: Text.rich(
                      style: TextStyleManager.description.copyWith(
                        fontWeight: FontWeight.normal,
                        color: ColorsManager.text,
                      ),
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already have an account?',
                          ),
                          TextSpan(
                            text: ' Log in',
                            style: TextStyleManager.description.copyWith(
                              fontWeight: FontWeight.normal,
                              color: ColorsManager.raspberry100,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                                final tabsRouter = AutoTabsRouter.of(
                                  widget.parentContext,
                                );
                                tabsRouter.setActiveIndex(1);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
