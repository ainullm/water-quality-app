import 'package:get/get.dart';

import '../controllers/calculate_controller.dart';

class CalculateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculateController>(
      () => CalculateController(),
    );
  }
}
