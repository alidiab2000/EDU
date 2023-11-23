import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../feature/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<Note> notes = [];
  fetchAllNotes() async {
    var notesBox = Hive.box<Note>(knoteBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess(notes: notes));
  }
}
