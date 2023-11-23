import 'package:flutter/material.dart';
import 'package:storeapp/Screens/home_page.dart';
import 'package:storeapp/Screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UptadeProductPage.id:(context) =>   const UptadeProductPage(),
      },
    );
  }
}
