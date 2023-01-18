// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../domain/core/constant_manager.dart';

// Project imports:

class LoadingDialog {
  static void hideLoadingDialog(BuildContext context) {
    if (_dialogIsVisible(context)) {
      context.router.pop();
    }
  }

  static bool _dialogIsVisible(BuildContext context) {
    bool isVisible = false;
    context.router.popUntil((route) {
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
