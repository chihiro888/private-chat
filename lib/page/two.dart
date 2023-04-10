import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:get/get.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPage();
}

class _TwoPage extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Two Page'),
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