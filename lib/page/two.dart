import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/widget/textSection.dart';
import 'package:get/get.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPage();
}

class _TwoPage extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Two Page'),
        ),
        body: Row(children: [
          textSection,
          ElevatedButton(
            onPressed: () {
              var locale = const Locale('en', 'US');
              Get.updateLocale(locale);
            },
            child: const Text('English'),
          ),
          ElevatedButton(
            onPressed: () {
              var locale = const Locale('ko', 'KR');
              Get.updateLocale(locale);
            },
            child: const Text('Korean'),
          ),
          ElevatedButton(
            onPressed: () {
              var locale = const Locale('ja', 'JP');
              Get.updateLocale(locale);
            },
            child: const Text('Japanese'),
          ),
        ]));
  }
}
