import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  ChatMessage({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message,
          style: isMe
              ? TextStyle(color: Colors.white)
              : TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7E57C2),
      appBar: AppBar(
        title: Text('그룹 채팅방 0'),
        backgroundColor: Color(0xFF7E57C2),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatMessage(message: 'Hello!', isMe: true),
                ChatMessage(message: 'Hi there!', isMe: false),
                ChatMessage(message: 'Hello!', isMe: true),
                ChatMessage(message: 'Hi there!', isMe: false),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.white)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '메시지를 입력하세요',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // 메시지 전송 로직을 추가하세요.
                  },
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context)
                .padding
                .bottom, // 입력창 아래의 하단 부분 높이만큼의 빈 컨테이너
            color: Colors.white, // 하얀색으로 변경
          ),
        ],
      ),
    );
  }
}
