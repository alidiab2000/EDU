import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:api_pro/data/model/user.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("users")
  Future<List<User>> getAllUsers();

  @GET("users/{id}")
  Future<User> getUserById(@Path() int id);

  @POST("users")
  Future<User> createNewUser(
    @Body() User newUser,
    @Header("Authorization") String token,
  );
  
  @DELETE('users/{id}')
  Future<dynamic> deleteUserById(@Path() int id, @Header("Authorization") String token,);
}
