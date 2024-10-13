import 'package:flutter/material.dart';
import 'package:shoppe/core/helpers/spacing.dart';
import 'package:shoppe/core/themes/colors.dart';
import 'package:shoppe/core/themes/styles.dart';

class DialogUtils {
  // show load
  static void showLoading(
      {required BuildContext context, required String text}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(
                backgroundColor: AppColors.mainBlue,
              ),
              10.width,
              Text(text, style: TextStyles.font18DarkBlueBold),
            ],
          ),
        );
      },
    );
  }

  // hide loading
  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  // show message
  static void showMessage(
    BuildContext context,
    String messageContent, {
    String? messageTitle,
    String? posActionName,
    Function? onPressedPosActionName,
    String? negActionName,
    Function? onPressedNegActionName,
    bool barrierDismissible = true,
    TextStyle? titleTextStyle,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressedPosActionName?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressedNegActionName?.call();
          },
          child: Text(
            textAlign: TextAlign.center,
            negActionName,
            style: TextStyles.font20BlueBold,
          )));
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            messageContent,
            style: TextStyles.font18DarkBlueBold,
          ),
          title: Text(
            messageTitle ?? "title",
            style: TextStyles.font24BlackBold,
          ),
          titleTextStyle: titleTextStyle,
          actions: actions,
        );
      },
    );
  }
}
