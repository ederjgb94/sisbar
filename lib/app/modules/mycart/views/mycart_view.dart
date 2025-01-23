import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mycart_controller.dart';

class MycartView extends GetView<MycartController> {
  const MycartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MycartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MycartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
