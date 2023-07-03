import 'package:get/get.dart';

class VerificationController {
  String _verificationId = '';

  VerificationController._privateConstructor();

  static final VerificationController _instance =
      VerificationController._privateConstructor();

  factory VerificationController() {
    return _instance;
  }

  String getVerificationId() {
    return _verificationId;
  }

  void setVerificationId(String verificationId) {
    _verificationId = verificationId;
  }
}
