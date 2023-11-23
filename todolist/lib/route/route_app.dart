import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Bloc/cubit/user_cubit.dart';
import 'package:todolist/constant/string.dart';
import 'package:todolist/data/repository/user_repo.dart';
import 'package:todolist/data/web_services/user_web_services.dart';
import 'package:todolist/presentation/screen/user_screen.dart';

class RouteApp {
  late UserCubit userCubit;
  late UserRepository userRepository;
  RouteApp() {
    userRepository = UserRepository(userWebServices: UserWebServices());
    userCubit = UserCubit(userRepository: userRepository);
  }
  Route? generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case allUserPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<UserCubit>(
            create: (_) => userCubit,
            child: const UsersScreen(),
          ),
        );
    }
    return null;
  }
}
