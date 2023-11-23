// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/data/repos/home_repo.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(
   {required this.homeRepo,}
  ) : super(SimilarBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchRecommendedBooks({required String category}) async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchRecommendedBooks(category: category);
    result.fold((failure) {
      emit(SimilarBookFailure(errorMessage: failure.errormessage));
    }, (books) {
      emit(SimilarBookSuccess(books: books));
    });
  }
 
}
