import 'package:get/get.dart';

class CountController extends GetxController {
  int count = 0;

  increment() {
    count++;
    print(count);
  }

  decrement() {
    count--;
    print(count);
  }
}
