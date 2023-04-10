import 'package:get/get.dart';

class CountRxController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;

  @override
  void onInit() {
    print('onInit 호출');

    once(count, (d) {
      print('최초 한번 실행 => $d');
    });

    ever(count, (d) {
      print('변경될 때 마다 실행 => $d');
    });

    debounce(
      count,
      (d) {
        print('5초 뒤에 실행 => $d');
      },
      time: Duration(seconds: 5),
    );

    super.onInit();
  }

  @override
  void onClose() {
    print('onClose 호출');

    super.onClose();
  }
}
