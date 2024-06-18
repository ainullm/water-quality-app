import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class MyButton {
  MyButton();

  static GestureDetector fill({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    Function()? onTap,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    TextStyle? textStyle,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: textStyle ??
                Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: textColor ?? white,
                    ),
          ),
        ),
      ),
    );
  }

  static InkWell outlined({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Function()? onTap,
    EdgeInsetsGeometry? padding,
    TextAlign? textAlign,
    double? width,
    double? height,
    TextStyle? textStyle,
  }) {
    return InkWell(
      // behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor ?? primaryColor,
            width: 0.5,
          ),
        ),
        child: Text(
          textAlign: textAlign ?? TextAlign.center,
          text,
          style: textStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor ?? primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
        ),
      ),
    );
  }
}
