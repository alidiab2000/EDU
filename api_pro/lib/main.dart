import 'package:api_pro/Bloc/cubit/user_cubit.dart';
import 'package:api_pro/home_screen.dart';
import 'package:api_pro/injection.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

void main() {
  initGetIt();
  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<UserCubit>(
        create: (context) => getIt<UserCubit>(),
        child: const HomePage(),
      ),
    );
  }
}
