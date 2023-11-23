// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/feature/views/widgets/color_widget/color_list_view.dart';

import '../../../../cubits/add_note_cubit/addnote_cubit.dart';
import '../../../models/note_model.dart';
import '../custom_button.dart';
import '../custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          CustomTextField(
            controller: titleController,
            onSaved: (val) {
              title = val;
            },
            label: "Title",
            hint: "Add Note Title",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: contentController,
            onSaved: (val) {
              content = val;
            },
            label: "Content",
            hint: "Add Note Content",
            maxlines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorListView(),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddnoteLoading ? true : false,
                onTap: () {
                  var currentDate = DateTime.now();
                  var forematedDate =
                      DateFormat().add_yMd().format(currentDate);
                  if (keyForm.currentState!.validate()) {
                    keyForm.currentState!.save();
                    var newNote = Note(
                      title: title!,
                      content: content!,
                      dateTime: forematedDate,
                      color: 1,
                    );
                    BlocProvider.of<AddnoteCubit>(context).addNote(newNote);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
