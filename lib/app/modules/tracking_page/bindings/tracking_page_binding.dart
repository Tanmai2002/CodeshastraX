import 'package:get/get.dart';

import '../controllers/tracking_page_controller.dart';

class TrackingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingPageController>(
      () => TrackingPageController(),
    );
  }
}
