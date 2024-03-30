import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final activeIndex=0.obs;
  late PageController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController= PageController(initialPage: 0);
  }

  void onBottomNavTap(int index){
    activeIndex.value=index;
    tabController.jumpToPage(index);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}
