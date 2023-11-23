import 'package:flutter/material.dart';
import 'package:whats_app/screens/calls_body.dart';
import 'package:whats_app/screens/chat_body.dart';
import 'package:whats_app/screens/status.body.dart';
import 'package:whats_app/widget/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomePage";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const AppBarCoustom(),
        body: const TabBarView(
          children: [
            ChatPage(),
            StatusPage(),
            CallsPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: ChatPage.icon,
        ),
      ),
    );
  }
}
