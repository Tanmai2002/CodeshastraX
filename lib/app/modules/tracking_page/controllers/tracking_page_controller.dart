import 'package:get/get.dart';

class TrackingPageController extends GetxController {
  //TODO: Implement TrackingPageController

  List<Map<String,dynamic>> checkpoints = [
    {
      'name':'Education'
    },
    {
      'name':'Planting'
    },
    {
      'name':'Schemes'
    }
  ];
  
  final current_checkpoint=0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  updateCurrentCheckpoint(int index){
    current_checkpoint.value=index;
    print(current_checkpoint.value);
    // notifyChildrens();
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
