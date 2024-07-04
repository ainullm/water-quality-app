import 'package:get/get.dart';

import '../controllers/sponsorship_controller.dart';

class SponsorshipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SponsorshipController>(
      () => SponsorshipController(),
    );
  }
}
