import 'package:codeshastra/app/modules/marketplace/controllers/marketplace_controller.dart';
import 'package:codeshastra/app/modules/tracking_page/controllers/tracking_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(TrackingPageController());
    Get.put(MarketplaceController());
  }
}
