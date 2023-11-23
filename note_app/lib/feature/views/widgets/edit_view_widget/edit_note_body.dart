import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'edit_color_item.dart';
import '../../../models/note_model.dart';
import '../custom_app_bar.dart';
import '../custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final Note note;
  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  @override
  void initState() {
    super.initState();
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: "Edit",
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: widget.note.title,
            label: "Title",
            controller: titleController,
            onChanged: (val) {
              title = val;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hint: widget.note.content,
            label: "EditContent",
            controller: contentController,
            maxlines: 5,
            onChanged: (val) {
              content = val;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          EidtColorItem(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
