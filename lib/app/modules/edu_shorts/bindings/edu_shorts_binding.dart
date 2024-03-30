import 'package:get/get.dart';

import '../controllers/edu_shorts_controller.dart';

class EduShortsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EduShortsController>(
      () => EduShortsController(),
    );
  }
}
