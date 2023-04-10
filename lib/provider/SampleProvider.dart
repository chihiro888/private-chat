import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<Response> getData() {
    var data = get('https://api.opensea.io/api/v1/assets?format=json');
    return data;
  }
}
