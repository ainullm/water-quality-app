import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calculate_controller.dart';

class CalculateView extends GetView<CalculateController> {
  const CalculateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalculateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CalculateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
