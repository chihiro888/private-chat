import 'package:flutter/material.dart';
import 'package:flutter_project/Internationalization/Messages.dart';
import 'package:flutter_project/page/home.dart';
import 'package:flutter_project/page/one.dart';
import 'package:flutter_project/page/two.dart';
import 'package:flutter_project/widget/textSection.dart';
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
      translations: Messages(),
      locale: const Locale('ko', 'KR'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/one', page: () => const OnePage()),
        GetPage(name: '/two', page: () => const TwoPage()),
      ],
    );
  }
}
