import 'package:flutter/material.dart';
import 'package:todolist/data/model/user.dart';

@immutable
class UserItem extends StatefulWidget {
  User user;
  UserItem({required this.user, super.key});
  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  " User ID : ${widget.user.userId} \n ID : ${widget.user.id}",
                ),
                const Spacer(
                  flex: 1,
                ),
                Checkbox(
                    activeColor: Colors.blue,
                    value: widget.user.completed,
                    onChanged: (val) {
                      widget.user.completed = val!;
                      setState(() {});
                    })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Title : ${widget.user.title}",
              style: const TextStyle(fontSize: 15),
              overflow: TextOverflow.clip,
            )
          ],
        ),
      ),
    );
  }
}
