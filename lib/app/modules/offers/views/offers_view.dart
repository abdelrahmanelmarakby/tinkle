import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OffersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OffersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
