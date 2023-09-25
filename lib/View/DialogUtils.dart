import 'package:flutter/material.dart';

import '../navigator_key.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message,
      {dismissible = true}) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  width: 12,
                ),
                Text(message)
              ],
            ),
          );
        },
        barrierDismissible: dismissible);
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
    bool dismissible = true,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.of(navigatorKey.currentContext!).pop();
            if (posAction != null) {
              posAction();
            }
          },
          child: Text(posActionTitle)));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(navigatorKey.currentContext!);
            if (negAction != null) {
              negAction();
            }
          },
          child: Text(negActionTitle)));
    }
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Text(
              message,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            actions: actions,
          );
        },
        barrierDismissible: dismissible);
  }
}
