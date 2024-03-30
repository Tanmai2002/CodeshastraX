import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:codeshastra/app/modules/tracking_page/views/tracking_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(activeIndex: controller.activeIndex.value,
      icons: [
        Icons.home,
        Icons.video_collection,
        Icons.shopping_bag
      ],
      onTap: (index){
        controller.onBottomNavTap(index);
      },
      ),
      body:  Center(
        child: PageView(
          controller:controller.tabController,
          children: [
            TrackingPageView(),
            Center(child: Text('Shorts')),
            Center(child: Text('Market Place')),
          ],
        )
      ),
    );
  }
}
