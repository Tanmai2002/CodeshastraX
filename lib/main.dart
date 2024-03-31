import 'package:codeshastra/app/util/Translator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      translations: Messages(),
      locale: Locale('hi', 'IN'),
      fallbackLocale: Locale('en','US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
