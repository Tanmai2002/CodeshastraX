import 'package:codeshastra/app/util/Translator.dart';
import 'package:codeshastra/app/modules/language/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async{
   await dotenv.load(fileName: ".env");
  runApp(
    GetMaterialApp(
      title: "Application",
      translations: Messages(),
      locale: Locale('hi', 'IN'),
      fallbackLocale: Locale('en','US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(LanguageController(),permanent : false);
      }),
    ),
  );
}
