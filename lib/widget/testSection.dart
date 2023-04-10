import 'package:flutter/material.dart';
import 'package:flutter_project/controller/APIController.dart';
import 'package:get/get.dart';

class TestSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final APIController apiController = Get.put(APIController());

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Obx(() => Text("${apiController.count}")),
    );
  }
}
