import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crop_image_controller.dart';

class CropImageView extends GetView<CropImageController> {
  const CropImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image for Crop or Soil'),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              controller.pickImage();
            }, child: Text('Pick Image')),
            Obx((){
              if(controller.image.value!=null){
                return Image.file(controller.image.value!);
              }
              return Container();
            }),
           
            ElevatedButton(onPressed: (){
              controller.uploadImage();
             
            }, child: Text('Upload Image')),
            Text('Note: Please upload image of crop or soil'),
            SingleChildScrollView(
              child: Obx((){
              return Text(controller.text.value);
            })
            )
            
          ],
        )
      ),
    );
  }
}
