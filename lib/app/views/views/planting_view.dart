import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PlantingView extends GetView {
  const PlantingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlantingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlantingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
