part of 'addnote_cubit.dart';

@immutable
sealed class AddnoteState {}

final class AddnoteInitial extends AddnoteState {}

final class AddnoteLoading extends AddnoteState {}

final class AddnoteSuccess extends AddnoteState {}

final class AddnoteFailure extends AddnoteState {
  final String exception;

  AddnoteFailure({required this.exception});
}