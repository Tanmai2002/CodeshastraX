import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:codeshastra/app/modules/marketplace/views/marketplace_view.dart';
import 'package:codeshastra/app/modules/tracking_page/views/tracking_page_view.dart';
import 'package:codeshastra/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCheck = false; // Example boolean variable, replace it with your logic

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.jpeg', // Path to your image asset
            width: 40, // Adjust the width as needed
            height: 40, // Adjust the height as needed
          ),
        ),
        title: const Text('KhetiSeva'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.LANGUAGE);
            },
            icon: const Icon(Icons.language),
          ),
          IconButton(onPressed:(){
            Get.toNamed(Routes.CROP_IMAGE);
          } , icon: Icon(Icons.camera))
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.VOICE_ASSISTANT);
          // Add your onPressed logic here
        },
        child: const Icon(Icons.video_collection),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: controller.activeIndex.value,
        icons: [Icons.home, Icons.shopping_bag],
        onTap: (index) {
          controller.onBottomNavTap(index);
        },
        activeColor: Colors.green,
        inactiveColor: Colors.grey[600],
        backgroundColor: Colors.white,
        gapLocation: GapLocation.center,
        iconSize: 30,
      ),
      body: Center(
        child: PageView(
          controller: controller.tabController,
          children: [
            TrackingPageView(),
            MarketplaceView(),
          ],
        ),
      ),
    );
  }
}
