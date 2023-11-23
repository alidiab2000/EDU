import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../feature/models/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  Color color = Colors.black;
  void addNote(Note note) async {
    note.color = color.value;
    emit(AddnoteLoading());
    try {
      var notesBox = Hive.box<Note>(knoteBox);
      await notesBox.add(note);
      emit(AddnoteSuccess());
    } catch (e) {
      emit(AddnoteFailure(exception: e.toString()));
    }
  }
}
