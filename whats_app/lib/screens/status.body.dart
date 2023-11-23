import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});
  static String id = "Status";
  final Icon icon = const Icon(Icons.camera_alt);
  Widget status_() {
    return const CircleAvatar(
      backgroundColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          children: [
            Row(
              children: [
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                    ),
                    Positioned(
                      top: 23,
                      left: 29,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Status",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Tap to add status update",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 15,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  "Your Status updates are",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                Text(
                  " end-to-end encryption",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 12,
                  ),
                )
              ],
            ),
            ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return status_();
              },
            )
          ],
        ));
  }
}
