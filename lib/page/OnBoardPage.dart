import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class OnBoardPage extends StatefulWidget {
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final controller = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight, // Align the button to the top right
            padding: EdgeInsets.all(32),
            child: TextButton(
              onPressed: () {
                Get.offAllNamed('/inviteCode');
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              children: [
                // 첫 번째 페이지
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/on1.png'),
                      Text('hello 1'),
                      // 추가적인 위젯들...
                    ],
                  ),
                ),
                // 두 번째 페이지
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/on2.png'),
                      Text('hello 2'),
                      // 추가적인 위젯들...
                    ],
                  ),
                ),
                // 세 번째 페이지
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/on3.png'),
                      Text('hello 3'),
                      // 추가적인 위젯들...
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 32), // 아래쪽 여백 32 추가
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (currentPageIndex == 0) {
                      // Handle first page, do nothing or handle as needed
                    } else {
                      controller.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    'Prev',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3, // 총 페이지 수
                  effect: WormEffect(), // 인디케이터 스타일 선택
                ),
                TextButton(
                  onPressed: () {
                    if (currentPageIndex == 2) {
                      Get.offAllNamed('/inviteCode');
                    } else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  },
                  child: Text(
                    currentPageIndex == 2 ? 'Start' : 'Next',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
