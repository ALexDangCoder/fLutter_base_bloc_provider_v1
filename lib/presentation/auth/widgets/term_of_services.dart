import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../../gen/assets.gen.dart';

class TermOfServices extends StatefulWidget {
  final void Function(bool status) onBoxTickTap;
  const TermOfServices({
    required this.onBoxTickTap,
    super.key,
  });

  @override
  State<TermOfServices> createState() => _TermOfServicesState();
}

class _TermOfServicesState extends State<TermOfServices> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _accepted = !_accepted;
              });
              widget.onBoxTickTap(_accepted);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: _accepted
                  ? Assets.images.selectedYes.svg(
                      width: 24.w,
                      height: 24.h,
                    )
                  : Assets.images.selectedNo.svg(
                      width: 24.w,
                      height: 24.h,
                    ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 304.w,
            child: Text.rich(
              style: TextStyleManager.fineText.copyWith(
                height: 16.h / 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              TextSpan(
                children: [
                  const TextSpan(text: 'By signing up, I agree to the'),
                  TextSpan(
                    text: ' Privacy Policy ',
                    style: TextStyleManager.fineText.copyWith(
                      height: 16.h / 12.sp,
                      color: ColorsManager.raspberry100,
                      fontWeight: FontWeight.normal,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: open link
                      },
                  ),
                  const TextSpan(text: 'and'),
                  TextSpan(
                    text: ' User Terms & Conditions',
                    style: TextStyleManager.fineText.copyWith(
                      height: 16.h / 12.sp,
                      color: ColorsManager.raspberry100,
                      fontWeight: FontWeight.normal,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: open link
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
