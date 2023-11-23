import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    required this.scafold,
    required this.image,
    required this.name,
    super.key,
  });
  final String image, name;
  final GlobalKey<ScaffoldState> scafold;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      leading: GestureDetector(
        onTap: () {
          scafold.currentState!.openDrawer();
        },
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 14),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.messenger),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
