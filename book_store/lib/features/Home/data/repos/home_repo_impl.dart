// ignore_for_file: avoid_print

import 'package:book_store/core/errors/failures.dart';
import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/data/repos/home_repo.dart';
import 'package:book_store/features/Home/data/web_services/web_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final WebServices _webServices;
  HomeRepoImpl(
    this._webServices,
  );
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      String endpoint =
          'volumes?Filtering=free-ebooks&q=subject:Computer science  &Sorting=newest';

      var data = await _webServices.get(endPoint: endpoint);
      List<BookModel> booksData = [];

      for (var item in data['items']) {
        try {
          booksData.add(BookModel.fromJson(item));
        } catch (e) {
          booksData.add(BookModel.fromJson(item));
        }
      }

      return right(booksData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      String endpoint = 'volumes?Filtering=free-ebooks&q=subject:Programming';
      var data = await _webServices.get(endPoint: endpoint);
      List<BookModel> booksData = [];

      for (var item in data['items']) {
        booksData.add(BookModel.fromJson(item));
      }
      return right(booksData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchRecommendedBooks(
      {required String category}) async {
    try {
      String endpoint =
          "volumes?Filtering=free-ebooks&q=subject:computer science&Sorting=relevance";

      var data = await _webServices.get(endPoint: endpoint);
      List<BookModel> booksData = [];

      for (var item in data['items']) {
        booksData.add(BookModel.fromJson(item));
      }
      return right(booksData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errormessage: e.toString()));
    }
  }
}
