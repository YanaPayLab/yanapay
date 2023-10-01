import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:yanapay/src/helpers/colors.dart';
import 'package:yanapay/src/helpers/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? label;
  final void Function()? onTap;
  final double height;
  final double width;
  final double labelSize;
  final Color? color;
  final Color labelColor;
  final Widget? child;
  final bool isLoading;

  const CustomElevatedButton({
    required this.onTap,
    this.label,
    this.width = double.infinity,
    this.height = 45.0,
    this.labelSize = 14.0,
    this.color = ColorLight.primary,
    this.labelColor = Colors.white,
    this.child,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (isLoading == true) ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Const.radius),
          ),
        ),
        child: (isLoading == true)
            ? const SpinKitRing(
                size: 20,
                color: Colors.white,
              )
            : (label != null)
                ? AutoSizeText(
                    label!,
                    maxLines: 1,
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: labelColor,
                      fontSize: labelSize,
                    ),
                  )
                : child,
      ),
    );
  }
}
