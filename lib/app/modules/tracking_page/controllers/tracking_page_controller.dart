import 'package:get/get.dart';

class TrackingPageController extends GetxController {
  //TODO: Implement TrackingPageController

  List<Map<String,dynamic>> checkpoints = [
    {
      'name':'Pre-Planting',
      'status':'completed'
    },
    {
      'name':'Planting',
      'status':'completed'
    },
    {
      'name':'Sale View',
      'status':'pending'
    }
  ];
  
  final current_checkpoint=0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
