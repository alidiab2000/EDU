import 'package:api_pro/Bloc/cubit/user_cubit.dart';
import 'package:api_pro/Bloc/cubit/user_state.dart';
import 'package:api_pro/data/model/user.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User newUser = User();
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "API Learn",
          ),
        ),
        body: Column(
          children: [
            BlocBuilder<UserCubit, ResultState>(builder: (_, state) {
              if (state is Idel) {
                newUser = User();
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      newUser.email!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
          ],
        ));
  }
}
