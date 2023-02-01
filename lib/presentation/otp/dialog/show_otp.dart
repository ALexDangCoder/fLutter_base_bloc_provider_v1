import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../otp_screen.dart';

void showOtp(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => const OtpScreen(),
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: (546 / 844).sh,
    ),
  );
}
