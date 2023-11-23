import 'package:api_pro/data/model/user.dart';
import 'package:api_pro/data/web_services/web_service.dart';

class Repo {
  WebServices webServices;
  Repo(this.webServices);
  final _token =
      "7c91df09822b80da80d26ea3d9b951bd7c9183b633c99f7a7e165b6491cff22f";
  Future<User> getUserById(int userId) async =>
      await webServices.getUserById(userId);

  Future<List<User>> getAllUsers() async => await webServices.getAllUsers();

  Future<User> createNewUser(User newUser) async =>
      await webServices.createNewUser(newUser, 'Bearer $_token');
  
  Future<dynamic> deleteUserById (int id) async =>
      await webServices.deleteUserById(id , 'Bearer $_token');
}
