import 'package:bloc/bloc.dart';
import 'package:todolist/data/model/user.dart';
import 'package:todolist/data/repository/user_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  List<User> users = [];
  UserCubit({
    required this.userRepository,
  }) : super(UserInitial());
 Future<List<User>> getUserById(int userId)async {
    try {
      userRepository.getUserById(userId).then(
        (userList) {
          emit(UsersLoaded(users: userList));
          users = userList;
        },
      );
      return users;
    } on Exception catch (ex) {
      emit(UserFaliur(e: ex));
      return [];
    }
  }
 Future<List<User>> getAllUsers()async {
    try {
      userRepository.getAllUsers().then(
        (userList) {
          emit(UsersLoaded(users: userList));
          users = userList;
        },
      );
      return users;
    } on Exception catch (ex) {
      emit(UserFaliur(e: ex));
      return [];
    }
  }
}
