import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/page/one.dart';
import 'package:flutter_project/page/two.dart';
import 'package:flutter_project/widget/textSection.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Row(children: [
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/one');
          },
          child: const Text('Go to OnePage'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/two');
          },
          child: const Text('Go to TwoPage'),
        ),
      ],
      )
        );
  }
}