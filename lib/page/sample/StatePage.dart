import 'package:flutter/material.dart';
import 'package:flutter_project/controller/CounterController.dart';
import 'package:flutter_project/controller/CounterRxController.dart';
import 'package:get/get.dart';

class StatePage extends StatelessWidget {
  final CountController countController = Get.put(CountController());
  final CountRxController countRxController = Get.put(CountRxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State'),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "simple state => ${countController.count}",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        countController.increment();
                      },
                      child: const Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        countController.decrement();
                      },
                      child: const Text('Decrement'),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Obx(
                      () => Text(
                        "Rx state => ${countRxController.count}",
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
                        countRxController.increment();
                      },
                      child: const Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        countRxController.decrement();
                      },
                      child: const Text('Decrement'),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
