// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(
    this.homeRepo,
  ) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(errorMessage: failure.errormessage));
    }, (books) {
      emit(NewsetBooksSuccess(books: books));
    });
  }
}
