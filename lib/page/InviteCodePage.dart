import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7E57C2),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 150, 20, 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '초대코드를 입력',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0), // 패딩 크기 조정 가능
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Spacer(), // 나머지 공간을 차지하기 위한 Spacer 추가
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0), // 하단 패딩 값 설정
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/phoneNumber');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF7E57C2), // 배경 색상을 #7E57C2로 변경
                        foregroundColor: Colors.white, // 폰트 색상을 #FFFFFF로 변경
                        side: BorderSide(
                            color: Colors.white), // 선 색상을 #FFFFFF로 변경
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text(
                        '다음',
                        style: TextStyle(
                          color: Colors.white, // 폰트 색상을 #FFFFFF로 변경 (선택사항)
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
