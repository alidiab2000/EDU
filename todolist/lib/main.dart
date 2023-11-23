// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todolist/route/route_app.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  ToDo({super.key});
  RouteApp routeapp = RouteApp()  ;
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeapp.generatRoute,
    );
  }
}
