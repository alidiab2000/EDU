// ignore_for_file: file_names, avoid_print
import 'package:bolc_learn/constants/strings.dart';
import 'package:dio/dio.dart';

class CharatersWebServices {
  late Dio dio;
  CharatersWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1));
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharaters() async {
    try {
      Response response = await dio.get('character');
      var data = response.data["results"];
      print("TEST Success");
      print(data.toString());
      return data;
    } catch (ex) {
      print(ex.toString());
      return [];
    }
  }
}
