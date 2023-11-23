import 'package:flutter/material.dart';

class AppBarCoustom extends StatelessWidget implements  PreferredSizeWidget {
  const AppBarCoustom({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(100.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(155, 1, 25, 12),
      title: const Text(
        "Whats app",
        style: TextStyle(color: Colors.white),
      ),
      bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 3.5,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          tabs: const <Widget>[
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ]),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
