// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  static String id = "Calls";
  // String name;
  // String time;
  const CallsPage({
    Key? key,
    // required this.name,
    // required this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ListTile(
        // leading: const CircleAvatar(
        //   radius: 30,
        //   backgroundColor: Colors.grey,
        // ),
        // title: Text(name),
        // subtitle: Row(
        //   children: [
        //     const Icon(
        //       Icons.call_made,
        //       color: Colors.green,
        //     ),
        //     Text("Today,$time"),
        //   ],
        // ),
        );
  }
}
