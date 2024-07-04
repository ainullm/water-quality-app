import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../styles/app_colors.dart';
import '../utils/images_utils.dart';

class MyMenuButtonWidget extends StatelessWidget {
  const MyMenuButtonWidget({
    super.key,
    this.icon,
    this.text,
    this.onTap,
    this.textColor,
  });

  final Widget? icon;
  final String? text;
  final Function()? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            icon ??
                AppImage.svg(
                  'ic-about',
                  color: black1,
                ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text ?? 'Nothing',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: textColor ?? black2),
            ),
          ],
        ),
      ),
    );
  }
}
