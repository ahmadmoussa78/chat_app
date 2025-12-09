import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          bottom: 32,
          right: 16,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14),
            bottomRight: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubleForFreind extends StatelessWidget {
  const ChatBubleForFreind({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          bottom: 32,
          right: 16,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
          color: Color(0xff0064d84),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
