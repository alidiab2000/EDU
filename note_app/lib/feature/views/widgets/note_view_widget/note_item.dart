import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/notes_cubit/notes_cubit.dart';
import '../../../models/note_model.dart';
import '../../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final Note note;
  Widget buildListTile(BuildContext context,
      {required String title, required String subtitle}) {
    return ListTile(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 18,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return EditNote(note: note);
            },
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildListTile(
                context,
                title: note.title,
                subtitle: note.content,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  note.dateTime,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
