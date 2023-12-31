import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/helpers/screens.dart';

class CustomSocialButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String icon;

  const CustomSocialButton({
    required this.label,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: Screens.width(context),
      height: 48,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Const.space25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: Const.space12),
            AutoSizeText(
              label,
              style: theme.textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
