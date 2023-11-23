import 'package:flutter/material.dart';
import '../model/message.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({required this.message, super.key});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 18, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: Colors.blueGrey,
        ),
        child: Text(message.message),
      ),
    );
  }
}
class ChatbubbleForFriends extends StatelessWidget {
  const ChatbubbleForFriends({required this.message, super.key});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 18, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: Colors.blue,
        ),
        child: Text(message.message),
      ),
    );
  }
}
