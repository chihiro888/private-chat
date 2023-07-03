import 'package:flutter/material.dart';
import 'package:flutter_project/Internationalization/Messages.dart';
import 'package:flutter_project/page/ChatListPage.dart';
import 'package:flutter_project/page/ChatPage.dart';
import 'package:flutter_project/page/InviteCodePage.dart';
import 'package:flutter_project/page/PhoneNumberPage.dart';
import 'package:flutter_project/page/PinNumberPage.dart';
import 'package:flutter_project/page/ExplorePage.dart';
import 'package:flutter_project/page/sample/APIPage.dart';
import 'package:flutter_project/page/sample/InternationalizationPage.dart';
import 'package:flutter_project/page/OnBoardPage.dart';
import 'package:flutter_project/page/sample/homePage.dart';
import 'package:flutter_project/page/sample/statePage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // sample
        GetPage(name: '/sample/state', page: () => StatePage()),
        GetPage(
            name: '/sample/internationalization',
            page: () => InternationalizationPage()),
        GetPage(name: '/sample/api', page: () => APIPage()),

        // main
        GetPage(name: '/', page: () => OnBoardPage()),
        GetPage(name: '/inviteCode', page: () => InviteCodePage()),
        GetPage(name: '/phoneNumber', page: () => PhoneNumberPage()),
        GetPage(name: '/pinNumber', page: () => PinNumberPage()),
        GetPage(name: '/explore', page: () => ExplorePage()),
        GetPage(name: '/chatList', page: () => ChatListPage()),
        GetPage(name: '/chat', page: () => ChatPage()),
      ],
    );
  }
}
