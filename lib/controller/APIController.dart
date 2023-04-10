import 'package:flutter_project/provider/SampleProvider.dart';
import 'package:get/get.dart';

class APIController extends GetxController {
  var count = 0.obs;

  initData() async {
    print('initData 호출');

    var data = await SampleProvider().getData();
    var c = data['count'];
    var e = data['entries'];

    // debug
    print("count => ${c}");
    print("entries => ${e}");

    // update state
    count.value = c;
  }

  @override
  void onInit() {
    print('onInit 호출');

    initData();

    super.onInit();
  }

  @override
  void onClose() {
    print('onClose 호출');

    super.onClose();
  }
}
