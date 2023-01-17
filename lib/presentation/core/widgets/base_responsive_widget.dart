// Flutter imports:
import 'package:flutter/material.dart';

class BaseResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const BaseResponsiveWidget({
    required this.mobile,
    this.tablet,
    this.desktop,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobile;
        }
        if (constraints.maxWidth < 1100) {
          return tablet ?? mobile;
        }

        return desktop ?? mobile;
      },
    );
  }
}
