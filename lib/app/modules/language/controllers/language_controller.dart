import 'package:get/get.dart';

class LanguageController extends GetxController {
  //TODO: Implement LanguageController
   List<Map<String,String>> languages=[
    {
      'name':'English',
      'code':'en'
    },
    {
      'name':'Hindi',
      'code':'hi'
    },
    {
      'name':'Marathi',
      'code':'mr'
    },
    {
      'name':'Tamil',
      'code':'ta'
    },
    {
      'name':'Telugu',
      'code':'te'
    },
    {
      'name':'Kannada',
      'code':'kn'
    },
    {
      'name':'Gujarati',
      'code':'gu'
    },
    {
      'name':'Bengali',
      'code':'bn'
    },
    {
      'name':'Punjabi',
      'code':'pa'
    },
    {
      'name':'Urdu',
      'code':'ur'
    },
    {
      'name':'Malayalam',
      'code':'ml'
    },
    {
      'name':'Odia',
      'code':'or'
    }
  ];
  RxString selectedLanguage='hi'.obs;
 void changeLanguage(String code){
    selectedLanguage.value=code;

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
