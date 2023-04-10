import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
        },
        'ko_KR': {
          'hello': '안녕하세요',
        },
        'ja_JP': {
          'hello': 'こんにちは',
        }
      };
}