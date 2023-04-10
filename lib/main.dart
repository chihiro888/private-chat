import 'package:flutter/material.dart';
import 'package:flutter_project/page/one.dart';
import 'package:flutter_project/page/two.dart';
import 'package:get/get.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Row(children: [
        ElevatedButton(
          onPressed: () {
            Get.to(() => const OnePage());
          },
          child: const Text('Go to OnePage'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(() => const TwoPage());
          },
          child: const Text('Go to TwoPage'),
        ),
      ],)
    );
  }
}