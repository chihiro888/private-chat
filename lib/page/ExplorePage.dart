import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _selectedIndex = 0;

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
    } else if (index == 0) {
      // "탐색"을 클릭했을 때
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 1) {
      // "채팅"을 클릭했을 때
      Get.offAllNamed('chatList');
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
                '탐색',
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
              itemCount: 3, // 예시로 3개의 그룹 채팅방 박스를 생성
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
                    onTap: () => {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          String nickname = ''; // 변수를 선언하여 입력된 닉네임을 저장

                          return AlertDialog(
                            title: Text('채팅방 입장'),
                            content: TextField(
                              onChanged: (value) {
                                nickname = value; // 입력된 닉네임을 변수에 저장
                              },
                              cursorColor: Color(0xFF7E57C2), // 커서 색상 설정
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFF7E57C2)), // active 상태일 때 선의 색상 설정
                                ),
                                labelText: '닉네임',
                                labelStyle: TextStyle(
                                    color: Color(0xFF7E57C2)), // 라벨 텍스트 색상 설정
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      '참가',
                                      style:
                                          TextStyle(color: Color(0xFF7E57C2)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .transparent, // 백그라운드 색상을 투명으로 설정
                                      elevation: 0, // 그림자 효과 제거
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // 팝업 닫기
                                      Get.toNamed('/chat');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      )
                    },
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
