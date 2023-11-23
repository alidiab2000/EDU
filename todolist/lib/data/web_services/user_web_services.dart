// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:todolist/constant/string.dart';

class UserWebServices {
  late Dio dio;
  UserWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getUserById(int userId) async {
    try {
      Response response = await dio.get('todos?userId=$userId');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  Future<List<dynamic>> getAllUsers( ) async {
    try {
      Response response = await dio.get('todos');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}
