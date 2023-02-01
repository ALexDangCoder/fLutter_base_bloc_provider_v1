import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';

class OtpResendButton extends StatefulWidget {
  const OtpResendButton({super.key});

  @override
  State<OtpResendButton> createState() => _OtpResendButtonState();
}

class _OtpResendButtonState extends State<OtpResendButton> {
  bool _resendAvailable = false;
  late final RestartableTimer _timer;
  final _totalSeconds = 60;
  late int _timeLeft;

  @override
  void initState() {
    super.initState();
    _timeLeft = _totalSeconds;
    _timer = RestartableTimer(
      const Duration(seconds: 1),
      () {
        if (_timeLeft == 1) {
          setState(() {
            _resendAvailable = true;
          });
        } else {
          setState(() {
            _timeLeft--;
          });
          _timer.reset();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resendText = _resendAvailable ? '' : 'in ${_timeLeft}s';

    return InkWell(
      onTap: () {
        setState(() {
          _resendAvailable = false;
          _timeLeft = _totalSeconds;
        });
        _timer.reset();
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 8.h),
        child: Text(
          'Resend OTP $resendText',
          style: TextStyleManager.description.copyWith(
            fontWeight: FontWeight.normal,
            color: _resendAvailable
                ? ColorsManager.raspberry100
                : ColorsManager.raspberry40,
          ),
        ),
      ),
    );
  }
}
