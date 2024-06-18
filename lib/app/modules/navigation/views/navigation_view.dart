import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/widgets/text_field_widget.dart';

import '../controllers/navigation_controller.dart';
import 'custom_navigation.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (_) {
        return Scaffold(
          body: _.listBody.elementAt(_.currentIndex),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: const Icon(
          //     Icons.mode_edit_outline_rounded,
          //     color: Colors.white,
          //   ),
          // ),
          bottomNavigationBar: CustomNavigation(
            currentIndex: _.currentIndex,
            onTap: _.changeIndex,
          ),
        );
      },
    );
  }
}
