// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.label,
    this.maxlines = 1,
    this.onSaved,
    this.onChanged,
    required this.controller,
  }) : super(key: key);
  final String hint;
  final String label;
  final int maxlines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Requierd";
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxlines,
      controller: controller,
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: Colors.cyan),
          ),
          hintText: hint,
          border: buildBorder(),
          enabledBorder: buildBorder(Colors.cyan),
          focusedBorder: buildBorder(Colors.cyan)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
