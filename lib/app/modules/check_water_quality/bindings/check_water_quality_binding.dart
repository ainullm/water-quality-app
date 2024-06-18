import 'package:get/get.dart';

import '../controllers/check_water_quality_controller.dart';

class CheckWaterQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckWaterQualityController>(
      () => CheckWaterQualityController(),
    );
  }
}
