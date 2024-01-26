import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/managers/constant_manager.dart';

// Project imports:

class LoadingDialog {
  static void hideLoadingDialog(BuildContext context) {
    if (_dialogIsVisible(context)) {
      context.pop();
    }
  }

  static bool _dialogIsVisible(BuildContext context) {
    bool isVisible = false;
    Navigator.popUntil(context, (route) {
      isVisible = route is PopupRoute;

      return !isVisible;
    });

    return isVisible;
  }

  static void showLoadingDialog(BuildContext context) {
    final alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.only(left: PaddingManager.p16),
            child: const Text("Loading..."),
          ),
        ],
      ),
    );
    if (!_dialogIsVisible(context)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
