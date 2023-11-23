import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static Icon icon = const Icon(Icons.message);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 22,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
          ),
          title: const Text("Name"),
          subtitle: const Text("Message"),
          trailing: Text(
            DateTime.now().toString().substring(11, 16),
          ),
        );
      },
    );
  }
}
