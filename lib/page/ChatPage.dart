import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 2) {
      // 로그아웃 버튼이 클릭되었을 때
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('로그아웃'),
            content: Text('로그아웃 하시겠습니까?'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text(
                      '취소',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // 팝업 닫기
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      '로그아웃',
                      style: TextStyle(color: Color(0xFF7E57C2)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // 백그라운드 색상을 투명으로 설정
                      elevation: 0, // 그림자 효과 제거
                    ),
                    onPressed: () {
                      Get.offAllNamed('/inviteCode');
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    } else if (index == 1) {
      // "채팅"을 클릭했을 때
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 0) {
      // "채팅"을 클릭했을 때
      Get.offAllNamed('explore');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7E57C2),
      appBar: AppBar(
        backgroundColor: Color(0xFF7E57C2),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                '채팅',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text(
                'titannetworks',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0), // 리스트뷰의 상단 패딩을 16.0으로 설정
            child: ListView.builder(
              itemCount: 1, // 예시로 3개의 그룹 채팅방 박스를 생성
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: 16,
                      left: 16,
                      right: 16), // 아이템의 하단 마진과 좌우 패딩을 16.0으로 설정
                  color: Colors.white, // 그룹 채팅방의 백그라운드 색상을 하얀색으로 설정
                  child: ListTile(
                    title: Text('그룹 채팅방 $index'),
                    subtitle: Text('참가 인원: 5명'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '탐색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: '로그아웃',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF7E57C2),
        onTap: _onItemTapped,
      ),
    );
  }
}
