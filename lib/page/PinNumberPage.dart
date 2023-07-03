import 'package:flutter/material.dart';
import 'package:flutter_project/controller/VerificationController.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PinNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pinController1 = TextEditingController();
    final focusNode1 = FocusNode();
    final formKey = GlobalKey<FormState>();

    const focusedBorderColor = Color(0xFFFFFFFF);
    const fillColor = Color(0xFFFFFFFF);
    const borderColor = Color(0xFFFFFFFF);

    final verificationController = VerificationController();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    String pin1Text = '';

    @override
    void dispose() {
      pinController1.dispose();
      focusNode1.dispose();
    }

    FirebaseAuth _auth = FirebaseAuth.instance;

    void verifySmsCode(String smsCode) async {
      // VerificationController verificationController = VerificationController();
      // String verificationId = verificationController.getVerificationId();

      // try {
      //   AuthCredential credential = PhoneAuthProvider.credential(
      //     verificationId: verificationId,
      //     smsCode: smsCode,
      //   );

      //   // 인증 완료
      //   await _auth.signInWithCredential(credential);

      //   // 인증 성공, 다음 작업 수행
      //   Get.offAllNamed('/explore');
      // } catch (e) {
      //   // 인증 실패
      //   print(e.toString());
      //   print('인증번호 불일치');
      // }

      Get.offAllNamed('/explore');
    }

    return Scaffold(
      backgroundColor: Color(0xFF7E57C2),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xFF7E57C2),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '인증번호 입력',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Pinput(
                      length: 6,
                      controller: pinController1,
                      focusNode: focusNode1,
                      // androidSmsAutofillMethod:
                      //     AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      // validator: (value) {
                      //   return value == '1231' ? null : 'Pin is incorrect';
                      // },
                      // onClipboardFound: (value) {
                      //   debugPrint('onClipboardFound: $value');
                      //   pinController.setText(value);
                      // },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');

                        verifySmsCode(pin);
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  // Spacer(),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 32.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // 인증번호 전송 버튼 클릭 시 처리 로직 추가
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xFF7E57C2),
                  //       foregroundColor: Colors.white,
                  //       side: BorderSide(color: Colors.white),
                  //       minimumSize: const Size.fromHeight(50),
                  //     ),
                  //     child: Text(
                  //       '인증번호 전송',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
