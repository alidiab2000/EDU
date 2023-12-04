// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    required this.keyboardType,
  });
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? obscureText;
  @override
  void initState() {
    super.initState();
    widget.labelText == 'Password' ? obscureText = true : obscureText = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          keyboardType: widget.keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Invalid Input';
            }
            return null;
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          obscureText: obscureText!,
          decoration: InputDecoration(
            suffixIcon: widget.labelText == 'Password'
                ? passWordIconVisilityOrNot()
                : null,
            labelText: widget.labelText,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          )),
    );
  }

  Widget passWordIconVisilityOrNot() {
    return IconButton(
      onPressed: () {
        setState(() {
          obscureText = !obscureText!;
        });
      },
      icon: Icon(
        obscureText! ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }
}
