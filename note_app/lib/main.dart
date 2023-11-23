import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'feature/models/note_model.dart';
import 'feature/views/notes_view.dart';
import 'note_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = NoteBlocObserver();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(knoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const NotesView(),
      ),
    );
  }
}
