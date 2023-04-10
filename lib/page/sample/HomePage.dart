import 'package:flutter/material.dart';
import 'package:flutter_project/page/sample/APIPage.dart';
import 'package:flutter_project/page/sample/InternationalizationPage.dart';
import 'package:flutter_project/page/sample/statePage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'State',
      'Internationalization',
      'API'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Get.to(() => StatePage());
              } else if (index == 1) {
                Get.to(() => InternationalizationPage());
              } else if (index == 2) {
                Get.to(() => APIPage());
              }
            },
            child: Container(
              height: 50,
              color: Color.fromARGB(66, 197, 197, 197),
              child: Center(
                child: Text(
                  'Sample ${index + 1}: ${entries[index]}',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
