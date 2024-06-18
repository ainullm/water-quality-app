import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/images_utils.dart';

class MyParameterWidget extends StatelessWidget {
  const MyParameterWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.textColor,
    required this.cardColor,
    this.paramValue,
  });
  final String icon;
  final String title;
  final String value;
  final Color textColor;
  final Color cardColor;
  final String? paramValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              AppImage.svg(icon, width: 35, height: 35),
              const SizedBox(width: 15),
              SizedBox(
                width: 75,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: textColor),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: value,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: textColor),
                  children: [
                    const TextSpan(text: '\t'),
                    TextSpan(
                      text: paramValue ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: textColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
