import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/core/config_manager.dart';
import '../../../domain/core/locale_keys.dart';
import '../../../domain/core/style_manager.dart';

class LoginScreenInfo extends StatelessWidget {
  const LoginScreenInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login Screen ${LocaleKeys.title.tr()} '
      '${Intl.getCurrentLocale()} '
      '${ConfigManager.getInstance()!.appFlavor}',
      textAlign: TextAlign.center,
      style: TextStyleManager.label3,
    );
  }
}
