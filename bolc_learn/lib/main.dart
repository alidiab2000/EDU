// ignore_for_file: must_be_immutable

import 'package:bolc_learn/app_router.dart';
 import 'package:flutter/material.dart';

void main() {
  runApp(BlocLearn());
}

class BlocLearn extends StatelessWidget {
  BlocLearn({super.key});
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
