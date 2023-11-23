// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todolist/data/model/user.dart';
import 'package:todolist/data/web_services/user_web_services.dart';

class UserRepository {
  UserWebServices userWebServices;
  UserRepository({
    required this.userWebServices,
  });
 Future<List<User>> getUserById(int userId) async {
    final users = await userWebServices.getUserById(userId);
    return users
        .map(
          (user) => User.fromJson(user),
        )
        .toList();
  }
 Future<List<User>> getAllUsers() async {
    final users = await userWebServices.getAllUsers();
    return users
        .map(
          (user) => User.fromJson(user),
        )
        .toList();
  }
}
