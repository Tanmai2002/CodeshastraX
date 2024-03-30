import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PrePlantingView extends GetView {
  const PrePlantingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrePlantingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrePlantingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
