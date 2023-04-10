import 'package:get/get.dart';

class SampleProvider extends GetConnect {
  // Get request
  Future<dynamic> getData() async {
    Response response = await get('https://api.publicapis.org/entries');
    if (response.statusCode == 200) {
      return response.body;
    }
    {
      return null;
    }
  }
}
