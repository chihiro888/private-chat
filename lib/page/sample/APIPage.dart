import 'package:flutter/material.dart';
import 'package:flutter_project/controller/APIController.dart';
import 'package:flutter_project/widget/testSection.dart';
import 'package:get/get.dart';

class APIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final APIController apiController = Get.put(APIController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('API'),
        ),
        body: Column(
          children: [
            Obx(() => Text("${apiController.count}")),
            TestSection(),
          ],
        ));
  }
}
