import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edu_shorts_controller.dart';

class EduShortsView extends GetView<EduShortsController> {
  const EduShortsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduShortsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EduShortsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
