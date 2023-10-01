import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanapay/src/helpers/colors.dart';
import 'package:yanapay/src/widgets/custom_elevated_button.dart';

class Dialogs {
  static Future<dynamic> showDialogWithLabel(
    BuildContext context, {
    String? title,
    String? labelButton,
    VoidCallback? onTapButton,
    bool barrierDismissible = false,
  }) {
    final theme = Theme.of(context);
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          content: SizedBox(
            height: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () => Get.back<dynamic>(),
                          color: Colors.white,
                          labelColor: ColorLight.fontTitle,
                          label: 'Cancel',
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: onTapButton,
                          label: labelButton,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
