import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SaleView extends GetView {
  SaleView({Key? key}) : super(key: key);

  // Define a list of government schemes available for farmers
  final List<String> governmentSchemes = [
    'PM Kisan Samman Nidhi Yojana',
    'PM Kisan Maan Dhan Yojana',
    'PM Fasal Bima Yojana',
    'PM Kisan Credit Card Scheme',
    'PM Kisan Mandhan Yojana',
    // Add more schemes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Government Schemes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: governmentSchemes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(governmentSchemes[index]),
            // You can add more information or links related to each scheme here
            // For example, you can add onTap callback to navigate to a details page
            onTap: () {
              // Add your navigation logic here
            },
          );
        },
      ),
    );
  }
}
