 import 'package:api_pro/data/model/user.dart';
import 'package:bloc/bloc.dart';
import 'package:api_pro/Bloc/cubit/user_state.dart';
 import 'package:api_pro/data/repository/my_repo.dart';



class UserCubit extends Cubit<ResultState<dynamic>> {
  final Repo repo;
  UserCubit(this.repo) : super(const Idel()  );
  void emitGetAllUser() async {
    List<User> data = await repo.getAllUsers();
    
    // data.when(success : (User userdata)){
    //   emit(ResultState.success(userdata));
    // };
   
  }

  // void emitGetUserById(int userId) async {
  //   await repo.getUserById(userId).then(
  //     (user) {
  //       emit(GetUser(user: user));
  //     },
  //   );
  // }

  // void emitCreateNewUser(User newUser) async {
  //   await repo.createNewUser(newUser).then(
  //     (newUser) {
  //       emit(CreateNewuser(newUser: newUser));
  //     },
  //   );
  // }

  // void emitDeleteUser(int id) async {
  //   await repo.deleteUserById(id).then(
  //     (data) {
  //       emit(Deleteuser(data: data));
  //     },
  //   );
  // }
}
