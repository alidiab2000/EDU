import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.label,
    required this.onchanged,
    required this.hintText,
    this.obscure = false ,
    super.key,
  });
  bool obscure ;
  String hintText;
  String label;
  // ignore: avoid_types_as_parameter_names
  Function(String value)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: (value) {
        if (value!.isEmpty) {
          return "Val is wrong";
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        label: Text(label),
      ),
    );
  }
}
