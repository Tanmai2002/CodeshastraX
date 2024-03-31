import 'package:codeshastra/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KhetiSeva'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(children: [

          DropdownMenu(
          onSelected: (value) {
            controller.changeLanguage( value!);
          },
          dropdownMenuEntries: controller.languages.map((e) => 
        DropdownMenuEntry(value: e['code']!, label: e['name']!)
        
        ).toList()),
        ElevatedButton(onPressed: (){
          Get.offAllNamed(Routes.HOME);
        }, child: Text('Continue'))
        ],)
      ),
    );
  }
}
