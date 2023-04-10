import 'package:flutter/material.dart';
import 'package:flutter_project/Internationalization/Messages.dart';
import 'package:flutter_project/page/sample/InternationalizationPage.dart';
import 'package:flutter_project/page/sample/homePage.dart';
import 'package:flutter_project/page/sample/statePage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('ko', 'KR'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/sample/state', page: () => StatePage()),
        GetPage(
            name: '/sample/internationalization',
            page: () => InternationalizationPage()),
      ],
    );
  }
}
