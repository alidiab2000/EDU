import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;
  Failure({
    required this.errormessage,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.errormessage});
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errormessage: "Connection Timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errormessage: "sendTimeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errormessage: "receiveTimeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errormessage: "Bad Certificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errormessage: "Request with ApiServer canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errormessage: "Connection Error");

      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure(errormessage: "NO internet  Conection");
        }
        return ServerFailure(
            errormessage: 'Unexpected Error Plz Try again later');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errormessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errormessage: "Your request Not Found , plz try later !");
    } else if (statusCode == 500) {
      return ServerFailure(
          errormessage: 'Internal server error ,plz Try later');
    } else {
      return ServerFailure(
          errormessage: 'Opps There was an error ,plz try again later!');
    }
  }
}

class NetWorkFailure extends Failure {
  NetWorkFailure({
    required super.errormessage,
  });
  factory NetWorkFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return NetWorkFailure(errormessage: response['error']['message']);
    } else if (statusCode == 404) {
      return NetWorkFailure(
          errormessage: "Your request Not Found , please try later !");
    } else if (statusCode == 500) {
      return NetWorkFailure(
          errormessage: 'Internal server error, please try later');
    } else {
      return NetWorkFailure(
          errormessage: 'Oops! There was an error, please try again later!');
    }
  }
  factory NetWorkFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return NetWorkFailure(errormessage: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return NetWorkFailure(errormessage: "sendTimeout");
      case DioExceptionType.receiveTimeout:
        return NetWorkFailure(errormessage: "receiveTimeout");
      case DioExceptionType.badCertificate:
        return NetWorkFailure(errormessage: "Bad Certificate");
      case DioExceptionType.badResponse:
        return NetWorkFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!);
      case DioExceptionType.cancel:
        return NetWorkFailure(errormessage: "Request canceled");
      case DioExceptionType.connectionError:
        return NetWorkFailure(errormessage: "Connection Error");

      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return NetWorkFailure(errormessage: "NO internet  Conection");
        }
        return NetWorkFailure(
            errormessage: 'Unexpected Error Plz Try again later');
    }
  }
 }
