import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.put(HomeController(), permanent: true);
    Get.put(ProfileController(), permanent: true);

  }
}
