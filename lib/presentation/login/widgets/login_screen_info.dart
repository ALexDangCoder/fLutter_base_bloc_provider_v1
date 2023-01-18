import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../app/multi-languages/multi_languages_utils.dart';

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
