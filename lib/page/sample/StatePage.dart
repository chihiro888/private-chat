import 'package:flutter/material.dart';
import 'package:flutter_project/controller/CounterController.dart';
import 'package:get/get.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePage();
}

class _StatePage extends State<StatePage> {
  final CountController c = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State'),
      ),
      body: Column(
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "${c.count}",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                child: const Text('Decrement'),
              )
            ],
          )
        ],
      ),
    );
  }
}
