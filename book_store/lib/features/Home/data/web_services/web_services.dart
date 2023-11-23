// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class WebServices {
  var baseURL = 'https://www.googleapis.com/books/v1/';
  Dio dio;

  WebServices({required this.dio});
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(endPoint);
    return response.data;
  }
}
