import 'package:get/get.dart';

class SponsorshipController extends GetxController {
  RxInt? indexImage;
  void setImageIndex(int index) {
    indexImage = index.obs;
    update();
  }
}
