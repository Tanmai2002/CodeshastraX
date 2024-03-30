import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SaleView extends GetView {
  const SaleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SaleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SaleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
