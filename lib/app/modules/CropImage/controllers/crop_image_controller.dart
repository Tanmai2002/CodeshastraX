import 'dart:io';

import 'package:codeshastra/app/data/gemini_provider.dart';
import 'package:codeshastra/app/modules/language/controllers/language_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class CropImageController extends GetxController {
  GeminiProvider geminiProvider = GeminiProvider();
  //TODO: Implement CropImageController
  Rx<File?> image = Rx<File?>(null);
  Rx<String> text = "".obs;
  void pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  File file = File(result.files.single.path!);
  image.value=file;
} else {
  // User canceled the picker
}
  }


  void uploadImage()async{
    if(image.value!=null){
      final res= await geminiProvider.getResponseWithImage("If it is Soil, describe features of soil like nutrient present in soil. If it is a plant or crop. Give details and if visible signs of diseases.Please respond in language with language code: ${Get.find<LanguageController>().selectedLanguage}", image.value!);
      print(res);
      text.value=res;
    }
  }
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
