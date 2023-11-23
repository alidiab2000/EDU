import 'package:fittech_app/screens/home_page.dart';
import 'package:fittech_app/screens/post_page.dart';

import './screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HealthCare());
}

class HealthCare extends StatelessWidget {
  const HealthCare({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 26, 26),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 4, 156, 103),
          background: Colors.teal,
          brightness: Brightness.dark,
          primary: Colors.teal,
          secondary: const Color.fromARGB(255, 4, 156, 103),
          surface: Colors.white70,
        ),
      ),
      home: const LoginScreen(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginScreen.id: (context) => const LoginScreen(),
        PostPage.id: (context) => const PostPage()
      },
    );
  }
}
