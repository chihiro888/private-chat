import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/CounterController.dart';
import 'package:flutter_project/main.dart';
import 'package:get/get.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePage();
}

class _OnePage extends State<OnePage> {
  final CountController c = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('One Page'),
        ),
        body: Row(children: [
          Obx(() => Text("${c.count}")),
          ElevatedButton(
            onPressed: () {
              c.increment();
            },
            child: const Text('Increment'),
          ),
          ElevatedButton(
            onPressed: () {
              c.decrement();
            },
            child: const Text('Increment'),
          )
        ]));
  }
}
