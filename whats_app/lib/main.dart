import 'package:flutter/material.dart';
import 'package:whats_app/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3:true),
      home: const HomePage(),
      title: "Ali Daib's Project",
    );
  }
}
