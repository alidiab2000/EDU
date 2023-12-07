import 'package:book_store/constat.dart';
import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/utils/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late String name;
  @override
  void initState() {
    name = SharedPref.prefs.getString(nameSharedPref) ?? 'User Name';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.black,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Image(
              image: AssetImage('assets/images/Logo.png'),
            ),
          ),
          ListTile(
            title: Text(name),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              FirebaseAuth.instance.currentUser!.displayName ?? "User name",
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            onPressed: () async {
              await SharedPref.setData(loginSharedPref, false);
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              }
            },
            child: const Text('Log Out'),
          )
        ],
      ),
    );
  }
}
