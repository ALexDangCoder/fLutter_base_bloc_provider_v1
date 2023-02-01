import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../injection.dart';
import '../otp_screen.dart';

Future<String?> showOtp(
  BuildContext parentContext, {
  required String phoneNumber,
}) async {
  return await showModalBottomSheet<String?>(
    context: parentContext,
    builder: (context) => BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: OtpScreen(phoneNumber: phoneNumber, parentContext: parentContext),
    ),
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    isScrollControlled: true,
    useRootNavigator: true,
    constraints: BoxConstraints(
      maxHeight: (546 / 844).sh,
    ),
  );
}
