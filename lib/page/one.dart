import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:get/get.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePage();
}

class _OnePage extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('One Page'),
        ElevatedButton(
        onPressed: () {
           Get.back();
        },
        child: const Text('Back to MyApp'),
      )
      ]
    );
  }
}