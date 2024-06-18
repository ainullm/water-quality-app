import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/helper/date_format_helper.dart';

class MyHistoryCalculateWidget extends StatelessWidget {
  const MyHistoryCalculateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: black2.withOpacity(0.2),
        ),
        color: whiteGrey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good Condition',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: primaryColor),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormatHelper.convertDate(DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: black1),
                  ),
                  Text(
                    DateFormatHelper.convertTime(DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: black1.withOpacity(0.7)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Temperature',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '25°C',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Row(
                children: [
                  Text(
                    'DO',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '5.0 mg/L',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: red),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Salinity',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '11 ppt',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: red,
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 75),
              Row(
                children: [
                  Text(
                    'pH',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '8',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.green,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
