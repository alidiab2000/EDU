import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Bloc/cubit/user_cubit.dart';
import 'package:todolist/presentation/widget/UserItem.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("To Do List"),
      ),
      body: buildBlocBuilder(),
    );
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UsersLoaded) {
          return ListView.builder(
            itemCount: state.users.length~/2,
            itemBuilder: (_, index) {
              return UserItem(
                user: state.users[index],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }
}
