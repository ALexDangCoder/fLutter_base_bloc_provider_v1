import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../../gen/assets.gen.dart';

class AppTextfield extends StatefulWidget {
  final String label;
  final String hintText;
  final bool readOnly;
  final SvgGenImage? prefixIcon;
  final SvgGenImage? suffixIcon;
  final void Function(String value)? onChanged;
  final String? errorText;
  final bool isShort;
  const AppTextfield({
    required this.label,
    required this.hintText,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.isShort = false,
    super.key,
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  final controller = TextEditingController();
  String errorText = '';

  Widget? get prefixIcon {
    if (widget.prefixIcon == null) return null;

    return Padding(
      padding: widget.suffixIcon == null
          ? EdgeInsets.symmetric(horizontal: 8.w)
          : EdgeInsets.only(left: 16.w),
      child: widget.prefixIcon?.svg(
        color: widget.readOnly ? ColorsManager.plum40 : ColorsManager.cueText,
      ),
    );
  }

  Widget? get suffixIcon {
    if (widget.suffixIcon == null) return null;

    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: widget.suffixIcon?.svg(
        color: widget.readOnly ? ColorsManager.plum40 : ColorsManager.cueText,
      ),
    );
  }

  TextAlign get textAlign {
    return prefixIcon != null && suffixIcon != null
        ? TextAlign.center
        : TextAlign.start;
  }

  BoxConstraints get iconContraints => BoxConstraints(
        maxWidth: 36.w,
        maxHeight: 20.h,
      );

  TextStyle get style =>
      TextStyleManager.paragraph.copyWith(fontWeight: FontWeight.w300);

  InputBorder get border => OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.divider),
        borderRadius: BorderRadius.circular(8.r),
      );

  Widget get error {
    if (errorText.isEmpty) return const SizedBox();

    return Text(
      errorText,
      style: TextStyleManager.textfieldError,
    );
  }

  @override
  void didUpdateWidget(covariant AppTextfield oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.errorText != widget.errorText) {
      setState(() {
        errorText = widget.errorText ?? '';
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double leadingPadding = widget.prefixIcon == null ? 16.w : 0;

    return SizedBox(
      width: widget.isShort ? 160.w : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyleManager.description.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorsManager.text,
            ),
          ),
          SizedBox(height: 4.h),
          TextField(
            controller: controller,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            textAlignVertical: TextAlignVertical.center,
            style: style.copyWith(color: ColorsManager.text),
            textAlign: textAlign,
            cursorColor: ColorsManager.text,
            decoration: InputDecoration(
              focusedBorder: border,
              border: border,
              hintText: widget.hintText,
              hintStyle: style.copyWith(color: ColorsManager.plum40),
              contentPadding: EdgeInsets.fromLTRB(leadingPadding, 8.h, 0, 8.h),
              prefixIcon: prefixIcon,
              prefixIconConstraints: iconContraints,
              suffixIcon: suffixIcon,
              suffixIconConstraints: iconContraints,
              filled: true,
              fillColor:
                  widget.readOnly ? ColorsManager.plum5 : ColorsManager.white,
            ),
          ),
          error,
        ],
      ),
    );
  }
}
