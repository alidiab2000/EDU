// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(
    this.homeRepo,
  ) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFraturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailuer(errorMessage: failure.errormessage));
    }, (books) {
      emit(FeaturedBooksSuccess(bookModel: books));
    });
  }
}
