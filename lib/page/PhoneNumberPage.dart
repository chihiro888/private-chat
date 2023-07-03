import 'package:flutter/material.dart';
import 'package:flutter_project/controller/VerificationController.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pinController1 = TextEditingController();
    final focusNode1 = FocusNode();
    final formKey = GlobalKey<FormState>();

    const focusedBorderColor = Color(0xFFFFFFFF);
    const fillColor = Color(0xFFFFFFFF);
    const borderColor = Color(0xFFFFFFFF);

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

    FirebaseAuth _auth = FirebaseAuth.instance;

    void verifyPhoneNumber() async {
      String phoneNumber = pinController1.text.trim();
      phoneNumber = '+8210' + phoneNumber;

      print(phoneNumber);

      if (phoneNumber.isNotEmpty) {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) async {
            // 자동 검증이 완료된 경우
            await _auth.signInWithCredential(phoneAuthCredential);
            // 인증 성공, 다음 작업 수행
            // 예를 들면, 홈 화면으로 이동
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
          },
          codeSent: (verificationId, resendToken) {
            // SMS가 성공적으로 전송된 경우
            VerificationController verificationController =
                VerificationController();
            verificationController.setVerificationId(verificationId);

            Get.toNamed('/pinNumber');
          },
          codeAutoRetrievalTimeout: (verificationId) {
            // 자동 검증 시간이 초과된 경우
            print(2);
            // setState(() {
            //   _confirmationResult = null;
            // });
          },
        );
      }
    }

    @override
    void dispose() {
      pinController1.dispose();
      focusNode1.dispose();
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
                    '핸드폰 번호 입력하고 시작하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10), // 상단 패딩 값 설정
                    child: Text(
                      '010',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Pinput(
                      length: 8,
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
                        verifyPhoneNumber();
                        // Get.toNamed('/pinNumber');
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
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // 인증번호 전송 버튼 클릭 시 처리 로직 추가
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7E57C2),
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text(
                        '인증번호 전송',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
