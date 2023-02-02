import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';

class OtpField extends StatefulWidget {
  final void Function(String otp) onChanged;
  const OtpField({
    required this.onChanged,
    super.key,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _otp = '';
  final _placeHolderOtp = '*';

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 6; i++) {
      _otp += _placeHolderOtp;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: const InputDecoration.collapsed(hintText: ''),
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {
                  _otp = value;
                  if (_otp.length < 6) {
                    final numberOfPlaceholder = 6 - _otp.length;
                    for (var i = 0; i < numberOfPlaceholder; i++) {
                      _otp += _placeHolderOtp;
                    }
                  }
                });
                if (value.length == 6) {
                  _focusNode.unfocus();
                }
              },
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              buildCounter: (
                context, {
                int? currentLength,
                bool? isFocused,
                maxLength,
              }) {
                return const SizedBox();
              },
              maxLength: 6,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _focusNode.requestFocus();
            },
            child: Container(
              width: double.infinity,
              height: 48.h,
              color: ColorsManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: const Border.fromBorderSide(
                        BorderSide(color: ColorsManager.divider),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _otp[index] == _placeHolderOtp ? '' : _otp[index],
                      style: TextStyleManager.paragraph.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
